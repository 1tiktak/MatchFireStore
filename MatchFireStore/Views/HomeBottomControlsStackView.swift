//
//  HomeBottomControlsStackView.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/11/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {
    
    static func creatButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }
    
    let refreshButton = creatButton(image: #imageLiteral(resourceName: "refresh_circle"))
    let dislikeButton = creatButton(image: #imageLiteral(resourceName: "dismiss_circle"))
    let superlikeButton = creatButton(image: #imageLiteral(resourceName: "super_like_circle"))
    let likeButton = creatButton(image: #imageLiteral(resourceName: "like_circle"))
    let specialButton = creatButton(image: #imageLiteral(resourceName: "boost_circle"))

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        [refreshButton, dislikeButton, superlikeButton, likeButton, specialButton].forEach { (button) in
            self.addArrangedSubview(button)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
