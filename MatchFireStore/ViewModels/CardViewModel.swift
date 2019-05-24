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


class CardViewModel {
    // We will define the properties view will display/render out
    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
    
    
    init(imageNames: [String], attributedString: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributedString = attributedString
        self.textAlignment = textAlignment
    }
    
    var imageIndex = 0
    
    
     func advanceToNextPhoto(){
        imageIndex = imageIndex + 1
    }
    
     func goToPreviousPhoto(){
        imageIndex = imageIndex - 1
    }
}


// What to do with the card model



