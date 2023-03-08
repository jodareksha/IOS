//
//  LoginController.swift
//  BrimoApp
//
//  Created by Joda Reksa on 06/03/23.
//

import UIKit

class LoginController: UIViewController {

    
    //label and logo
    private let headerViews = AuthHeaderView(title: "Welcome", subTitle:"Sign in to your Account")
    
    //textField or textInput
    private let emailField = CostumTextField(fieldType: .email)
    private let PassField = CostumTextField(fieldType: .password)
    
    // button costume
    private let SignInButton = CostumeButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUser = CostumeButton(title: "New ? Call Center ", fontSize: .med)
    private let ForgotButt = CostumeButton(title: "Forgot Password ?", fontSize: .sm)
    
    //conditiom
    private var isSignInEnabled = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        // action button or onpress
        self.SignInButton.addTarget(self, action: #selector(didTapSign), for: .touchUpInside)
        self.newUser.addTarget(self, action: #selector(didTapNew), for: .touchUpInside)
        self.ForgotButt.addTarget(self, action: #selector(didTapForgot), for: .touchUpInside)
        
        updateSignInButton()
    }
    
    
    private func setupUI(){
        // background system
        self.view.backgroundColor = .systemBackground
        
        // add component or sub view
        self.view.addSubview(headerViews)
        self.view.addSubview(emailField)
        self.view.addSubview(PassField)
        self.view.addSubview(SignInButton)
        self.view.addSubview(ForgotButt)
        self.view.addSubview(newUser)
        
        // off manual auto resize
        headerViews.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        PassField.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.translatesAutoresizingMaskIntoConstraints = false
        ForgotButt.translatesAutoresizingMaskIntoConstraints = false
        newUser.translatesAutoresizingMaskIntoConstraints = false

        
        //button condition
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        PassField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            // header or logo anchoring or coordinate
            self.headerViews.topAnchor.constraint(equalTo: self.view.topAnchor),
//            self.headerViews.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerViews.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerViews.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViews.heightAnchor.constraint(equalToConstant: 340 ),
//            self.headerViews.heightAnchor.constraint(equalToConstant: 222 ),
        
            // cordinate for email input
            self.emailField.topAnchor.constraint(equalTo: headerViews.bottomAnchor,constant: 20),
            self.emailField.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55 ),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),
            
            // cordinate for password input
            self.PassField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 20),
            self.PassField.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.PassField.heightAnchor.constraint(equalToConstant: 55 ),
            self.PassField.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),

            // cordinate button Sign in
            self.SignInButton.topAnchor.constraint(equalTo: PassField.bottomAnchor,constant: 20),
            self.SignInButton.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.SignInButton.heightAnchor.constraint(equalToConstant: 50 ),
            self.SignInButton.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),
            
            //cordinate new user
            self.newUser.topAnchor.constraint(equalTo: SignInButton.bottomAnchor,constant: 11),
            self.newUser.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.newUser.heightAnchor.constraint(equalToConstant: 44 ),
            self.newUser.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),
            
            // cordinate forgot pass
            self.ForgotButt.topAnchor.constraint(equalTo: newUser.bottomAnchor,constant: 6),
            self.ForgotButt.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.ForgotButt.heightAnchor.constraint(equalToConstant: 44 ),
            self.ForgotButt.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),
        
        ])
        
        self.headerViews.backgroundColor = self.hexStringToUIColor(hex: "1e487a")
    }
    
    private func hexStringToUIColor(hex: String) -> UIColor {
        let hexString = hex

        // Convert the hex string to a UInt32 value
        guard let hexValue = UInt32(hexString, radix: 16) else {
            print("Invalid hex string")
            return .clear // Return a default value if the conversion fails
        }

        // Extract the red, green, and blue values from the hex value
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hexValue & 0x0000FF) / 255.0

        // Create a UIColor instance using the extracted RGB values
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    // condition must fill the field
    private func updateSignInButton() {
        let email = emailField.text ?? ""
        let password = PassField.text ?? ""
        
        let isEnabled = !email.isEmpty && !password.isEmpty
        
        if isEnabled != isSignInEnabled {
            isSignInEnabled = isEnabled
            
            SignInButton.isEnabled = isEnabled
            SignInButton.alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        updateSignInButton()
    }
    
    // function press or selector
    @objc private func didTapSign(){
        let nav = HomeController()
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    @objc private func didTapNew(){
        print("test Debug","didTapNew")
    }
    
    @objc private func didTapForgot(){
        print("test Debug","didTapForgot")
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.navigationController?.navigationBar.isHidden = true
    //    }

}
