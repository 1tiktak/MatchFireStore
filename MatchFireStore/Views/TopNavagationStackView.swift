//
//  TopNavagationStackView.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/11/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit

class TopNavagationStackView: UIStackView {
    
    let settingsBUtton = UIButton(type: .system)
    let messagesBUtton = UIButton(type: .system)
    let fireImageView = UIImageView(image: #imageLiteral(resourceName: "app_icon"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true

        fireImageView.contentMode = .scaleAspectFit
        
        settingsBUtton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messagesBUtton.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsBUtton, UIView(), fireImageView, UIView(), messagesBUtton].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering

        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
