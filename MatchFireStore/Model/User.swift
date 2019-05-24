//
//  User.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/18/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit



struct User: ProducesCardViewModel {
    // Defining our properties for out model layer.
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))

        return CardViewModel(imageNames: imageNames, attributedString: attributedText, textAlignment: .left)
    }
}


