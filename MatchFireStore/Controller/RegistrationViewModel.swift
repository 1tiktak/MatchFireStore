//
//  RegistrationViewModel.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/28/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit




class RegistrationViewModel {
    
    var bindableImage = Bindable<UIImage>()
    
//    var image: UIImage? {
//        didSet {
//            imageObserver?(image)
//        }
//    }
//
//    var imageObserver: ((UIImage?) -> ())?
    
    var fullName: String? {
        didSet {
            checkFormValidity()
        }
    }
    var email: String? {didSet { checkFormValidity() } }
    var password: String? { didSet {checkFormValidity() } }
    
    fileprivate func checkFormValidity(){
        let isFormValid = fullName?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false
        
        bindableisFormValid.value = isFormValid
        
//        isFormValidObserver?(isFormValid)
    }
    
    var bindableisFormValid = Bindable<Bool>()
    
    
    // Reactive programming silmilar to
//    var isFormValidObserver: ((Bool) -> ())?
}
