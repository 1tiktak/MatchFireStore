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
            checkFormValidity()
        }
    }
    var email: String? {didSet { checkFormValidity() } }
    var password: String? { didSet {checkFormValidity() } }
    
    fileprivate func checkFormValidity(){
        let isFormValid = fullName?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false
        
        isFormValidObserver?(isFormValid)
    }
    
    
    // Reactive programming silmilar to
    var isFormValidObserver: ((Bool) -> ())?
}
