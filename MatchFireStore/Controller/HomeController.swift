//
//  ViewController.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/11/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

class HomeController: UIViewController, SettingsControllerDelegate {
  
    
    
    let topStackView = TopNavagationStackView()
    let cardsDeckView = UIView()
    let bottomControls = HomeBottomControlsStackView()
    
    
    var cardViewModels = [CardViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsBUtton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        bottomControls.refreshButton.addTarget(self, action: #selector(handleRefresh), for: .touchUpInside)
        
        setUpLayout()
        fetchCurrentUser()
//        setupFireStoreUserCards()
//        fetchUsersFromFirestore()
    }
    
    fileprivate var user: User?
    
    
      fileprivate func fetchCurrentUser(){
        guard let uid =  Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("Users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                print(err)
                return
            }
            // we have fetched our user here
            guard let dictionary = snapshot?.data() else { return }
            self.user = User(dictionary: dictionary)
            self.fetchUsersFromFirestore()
        }
    }

    @objc fileprivate func handleRefresh(){
        fetchUsersFromFirestore()
    }
    
    
    var lastFetchedUser: User?
    
    fileprivate func fetchUsersFromFirestore(){
        
        guard let minAge = user?.minSeekingAge, let maxAge = user?.maxSeekingAge else
        {return}
        
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Reeling in Couples"
        hud.show(in: view)
        let query = Firestore.firestore().collection("Users").whereField("age", isGreaterThanOrEqualTo: minAge).whereField("age", isLessThanOrEqualTo: maxAge)
        query.getDocuments { (snapshot, err) in
            hud.dismiss(animated: true)
            if let err = err {
                print("Failed to fetch users 😭", err)
                return
            }
            
            snapshot?.documents.forEach({ (documentSnapshot) in
                let userDictionary = documentSnapshot.data()
                let user = User(dictionary: userDictionary)
                self.cardViewModels.append(user.toCardViewModel())
                self.lastFetchedUser = user
                self.setupCardFromUser(user: user)
            })
        }
    }
    
    fileprivate func setupCardFromUser(user: User){
        let cardView = CardView(frame: .zero)
        cardView.cardViewModel = user.toCardViewModel()
        cardsDeckView.addSubview(cardView)
        cardsDeckView.sendSubviewToBack(cardView)
        cardView.fillSuperview()
    }
    
    @objc func handleSettings() {
        
        let settingsController = SettingsController()
        settingsController.delegate = self
        let navController = UINavigationController(rootViewController: settingsController)
        present(navController, animated: true)
    }
    func didSaveSettings() {
     print("Notified of dismissal")
        fetchCurrentUser()
    }
    
    
    fileprivate func setupFireStoreUserCards() {
        
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }

    // MARK: - FilePrivate
        fileprivate func setUpLayout() {
        view.backgroundColor = .white
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, bottomControls])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
            
            overallStackView.isLayoutMarginsRelativeArrangement = true
            overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 12)
            
            overallStackView.bringSubviewToFront(cardsDeckView)
    }
}

