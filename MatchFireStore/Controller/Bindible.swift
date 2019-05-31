//
//  Bindible.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/31/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import Foundation


class Bindable<T> {
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
