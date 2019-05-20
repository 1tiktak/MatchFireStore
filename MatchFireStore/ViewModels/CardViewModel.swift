//
//  CardViewModel.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/18/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit


protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
    
}


struct CardViewModel {
    // We will define the properties view will display/render out
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}


// What to do with the card model



