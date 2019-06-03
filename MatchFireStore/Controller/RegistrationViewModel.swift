//
//  RegistrationViewModel.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/28/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewModel {
    
    var bindableIsRegistering = Bindable<Bool>()
    var bindableImage = Bindable<UIImage>()
    var bindableisFormValid = Bindable<Bool>()
    
    
    var fullName: String? {
        didSet {
            checkFormValidity()
        }
    }
    var email: String? {didSet { checkFormValidity() } }
    var password: String? { didSet {checkFormValidity() } }
    
    func performRegistration(completion: @escaping (Error?) -> ()) {
        guard let email = email, let password = password else { return }
        bindableIsRegistering.value = true
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if let err = err {
                print(err)
                completion(err)
                return
            }
            
            print("Sucessfully signed up 🤓", res?.user.uid ?? "")
            self.saveImageToFirebase(completion: completion)
            
        }
    }
    
    fileprivate func saveImageToFirebase(completion: @escaping (Error?) -> ()){
        
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/images/\(filename)")
        let imageData = self.bindableImage.value?.jpegData(compressionQuality: 0.75) ?? Data()
        ref.putData(imageData, metadata: nil, completion: { (_, err) in
            
            if let err = err {
                completion(err)
                return // bail
            }
            
            print("Finished uploading photo to storage")
            ref.downloadURL(completion: { (url, err) in
                if let err = err {
                    completion(err)
                    return
                }
                self.bindableIsRegistering.value = false
                print("Download url", url?.absoluteString ?? "")
                
                let imageUrl = url?.absoluteString ?? ""
                self.saveInfoToFireStore(imageUrl: imageUrl, completion: completion)
                completion(nil)
            })
        })
        
    }
    
    fileprivate func saveInfoToFireStore(imageUrl: String, completion: @escaping (Error?) -> ()) {
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        let docData = ["fullName": fullName ?? "", "uid" : uid, "imageUrl1": imageUrl]
        Firestore.firestore().collection("Users").document(uid).setData(docData) { (err) in
            if let err = err {
                completion(err)
                return
            }
            completion(nil)
        }
    }
    
    fileprivate func checkFormValidity(){
        let isFormValid = fullName?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false
        
        bindableisFormValid.value = isFormValid
    }
}
