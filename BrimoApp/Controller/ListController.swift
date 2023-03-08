//
//  ListController.swift
//  BrimoApp
//
//  Created by Joda Reksa on 08/03/23.
//

import UIKit

class ListController: UIViewController {

    private let AmountField = CostumTextField(fieldType: .Amount)
    private let headerViews = AuthHeaderView(title: "Tranfer", subTitle:"Dengan mudah dengan BRI")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        AmountField.addTarget(self, action: #selector(currencyFieldChanged), for: .editingChanged)
//        AmountField.local = Locale(identifier: "pt_BR")
        // Do any additional setup after loading the view.
    }
    
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = false
        }
    
    func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.headerViews.backgroundColor = self.hexStringToUIColor(hex: "1e487a")
        self.view.addSubview(AmountField)
        self.view.addSubview(headerViews)
        
        headerViews.translatesAutoresizingMaskIntoConstraints = false
        AmountField.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            self.headerViews.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerViews.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerViews.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViews.heightAnchor.constraint(equalToConstant: 220 ),
            
            self.AmountField.topAnchor.constraint(equalTo: headerViews.bottomAnchor,constant: 20),
            self.AmountField.centerXAnchor.constraint(equalTo: headerViews.centerXAnchor),
            self.AmountField.heightAnchor.constraint(equalToConstant: 55 ),
            self.AmountField.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.80  ),
        ])

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
    @objc func currencyFieldChanged() {
        print(#function)

//        print("decimal:", AmountField.decimal)
//        print("doubleValue:",(AmountField.decimal as NSDecimalNumber).doubleValue, terminator: "\n\n")
    }

    
}
