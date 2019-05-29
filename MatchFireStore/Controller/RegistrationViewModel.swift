//
//  RegistrationViewModel.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/28/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit




class RegistrationViewModel {
    
    var fullName: String? {
        didSet {
            
        }
    }
    var email: String? {didSet {} }
    var password: String? { didSet {} }
    
    
    // Reactive programming silmilar to
    var isFormValidObserver: ((Bool) -> ())?
}
