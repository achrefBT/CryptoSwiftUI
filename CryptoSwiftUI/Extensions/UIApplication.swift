//
//  UIApplication.swift
//  CryptoSwiftUI
//
//  Created by Achref Ben Tekaya on 8/9/2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
