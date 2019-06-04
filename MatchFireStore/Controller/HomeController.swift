//
//  ViewController.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/11/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    let topStackView = TopNavagationStackView()
    let cardsDeckView = UIView()
    let bottomStackView = HomeBottomControlsStackView()
    
    var cardViewModels = [CardViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsBUtton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        
        setUpLayout()
        setupFireStoreUserCards()
        fetchUsersFromFirestore()
    }
    
    fileprivate func fetchUsersFromFirestore(){
        
        let query = Firestore.firestore().collection("Users")
//        let query = Firestore.firestore().collection("Users").whereField("friends", arrayContains: "Chris")
        query.getDocuments { (snapshot, err) in
            if let err = err {
                print("Failed to fetch users 😭", err)
                return
            }
            
            snapshot?.documents.forEach({ (documentSnapshot) in
                let userDictionary = documentSnapshot.data()
                let user = User(dictionary: userDictionary)
                self.cardViewModels.append(user.toCardViewModel())
            })
            
            self.setupFireStoreUserCards()
        }
    }
    
    @objc func handleSettings() {
        print("Show signUp page")
        
        let registrationController = RegistrationController()
        present(registrationController, animated: true)
    }
    
    // Setting up cards
    
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
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, bottomStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
            
            overallStackView.isLayoutMarginsRelativeArrangement = true
            overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 12)
            
            overallStackView.bringSubviewToFront(cardsDeckView)
    }
}

