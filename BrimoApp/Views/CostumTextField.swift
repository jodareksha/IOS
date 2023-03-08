//
//  CostumTextField.swift
//  BrimoApp
//
//  Created by Joda Reksa on 06/03/23.
//

import UIKit

class CostumTextField: UITextField {

    enum CostumeTextFieldType {
        case email
        case password
        case Amount
        case inputScreen
        case input2FA
        case input3FA
    }
    
    private let authFieldType : CostumeTextFieldType
    
    init (fieldType :CostumeTextFieldType){
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(
            x: 0 ,y: 0 ,width: 12, height: self.frame.size.height
        ))
        
        switch fieldType {
        case .email:
            self.placeholder = "Email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .Amount:
            self.placeholder = "Nominal"
            self.textContentType = .oneTimeCode
            self.keyboardType = .numberPad
        case.inputScreen:
            self.placeholder = "PIN"
            self.textContentType = .oneTimeCode
            self.keyboardType = .numberPad
        case.input2FA:
            self.placeholder = "PIN2FA"
            self.textContentType = .oneTimeCode
            self.keyboardType = .numberPad
        case.input3FA:
            self.placeholder = "PIN3FA"
            self.textContentType = .oneTimeCode
            self.keyboardType = .numberPad

        }
    }
    
    required init?(coder : NSCoder){
        fatalError("init(coder) has not been Implements");
    }
    
}
