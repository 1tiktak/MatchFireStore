//
//  ViewController.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/11/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView = TopNavagationStackView()
    let cardsDeckView = UIView()
    let bottomStackView = HomeBottomControlsStackView()
    
//    let users = [
//        User(name: "Kelly", age: 23, profession: "Engineer", imageName: "lady5c"),
//
//        User(name: "Thomas", age: 18, profession: "Intern", imageName: "Thomas")
//
//    ]
    
    
    let cardViewModels: [CardViewModel] = {
        
        let producers = [
            
            User(name: "Adriel", age: 24, profession: "Marketing", imageName: "lady5c"),
            User(name: "Thomas", age: 18, profession: "Intern", imageName: "Thomas"),
            
            Advertiser(title: "GrubHub", brandName: "Hungry Yet?", posterPhotoName: "advertising_sample")
        ] as [ProducesCardViewModel]
        
        let viewModels = producers.map({return $0.toCardViewModel()})
        return viewModels
        
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpLayout()
        
        setupDummyCards()
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
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, bottomStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
            
            overallStackView.isLayoutMarginsRelativeArrangement = true
            overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 12)
            
            overallStackView.bringSubviewToFront(cardsDeckView)
    }
}

