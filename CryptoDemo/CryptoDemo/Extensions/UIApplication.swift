//
//  UIApplication.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/11/25.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
