//
//  String+Extension.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/27/22.
//

import Foundation

enum Validation {
    case email
    case password
}

enum RegxEnum {
    
    static let emailRegx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}"
    static let passwordRegx = "[a-zA-Z0-9]{8,24}"
}

extension String {
    
    func validateText(validate: Validation) -> Bool {
        
        var regx: String {
            switch validate {
            case .email: return RegxEnum.emailRegx
            case .password: return RegxEnum.passwordRegx
            }
        }
        
        let predicate = NSPredicate(format: "self matches %@", regx)
        
        guard !self.isEmpty else {
            return false
        }
       return predicate.evaluate(with: self)
    }
}
