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

    
    
//    let cardViewModels: [CardViewModel] = {
//
//        let producers = [
//
//            User(name: "Jane", age: 24, profession: "DJ", imageNames: ["jane1", "jane2", "jane3"]),
//            User(name: "Kelly", age: 18, profession: "Intern", imageNames: ["kelly1", "kelly2", "kelly3"]),
//            User(name: "Adriel", age: 24, profession: "Marketing", imageNames: ["lady5c", "lady6c", "lady7c"]),
//
//            Advertiser(title: "GrubHub", brandName: "Hungry Yet?", posterPhotoName: "advertising_sample")
//        ] as [ProducesCardViewModel]
//
//        let viewModels = producers.map({return $0.toCardViewModel()})
//        return viewModels
//
//}()
    
    var cardViewModels = [CardViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsBUtton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        
        setUpLayout()
        setupDummyCards()
        fetchUsersFromFirestore()
    }
    
    fileprivate func fetchUsersFromFirestore(){
        Firestore.firestore().collection("Users").getDocuments { (snapshot, err) in
            if let err = err {
                print("Failed to fetch users 😭", err)
                return
            }
            
            snapshot?.documents.forEach({ (documentSnapshot) in
                let userDictionary = documentSnapshot.data()
                let user = User(dictionary: userDictionary)
                self.cardViewModels.append(user.toCardViewModel())
            })
            
            self.setupDummyCards()
        }
    }
    
    @objc func handleSettings() {
        print("Show signUp page")
        
        let registrationController = RegistrationController()
        present(registrationController, animated: true)
    }
    
    // Setting up cards
    
    fileprivate func setupDummyCards() {
        
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

