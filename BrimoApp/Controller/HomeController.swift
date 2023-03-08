//
//  HomeController.swift
//  BrimoApp
//
//  Created by Joda Reksa on 06/03/23.
//

import UIKit
import Alamofire

class HomeController: UIViewController {

    
    private let headerViews = AuthHeaderView(title: "WELCOME", subTitle:"COSTUMER")
    private let Transfers = CostumeButton(title: "Transfer", hasBackground: true, fontSize: .big)
    private let ListScreen = CostumeButton(title: "Histroy", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        self.Transfers.addTarget(self, action: #selector(GoTransfers), for: .touchUpInside)
        self.ListScreen.addTarget(self, action: #selector(GoList), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerViews)
        self.view.addSubview(Transfers)
        self.view.addSubview(ListScreen)
        
        headerViews.translatesAutoresizingMaskIntoConstraints = false
        Transfers.translatesAutoresizingMaskIntoConstraints = false
        ListScreen.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerViews.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerViews.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerViews.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViews.heightAnchor.constraint(equalToConstant: 222 ),
            
            self.Transfers.topAnchor.constraint(equalTo: headerViews.bottomAnchor,constant: 20),
            self.Transfers.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 20),
            self.Transfers.heightAnchor.constraint(equalToConstant: 100 ),
            self.Transfers.widthAnchor.constraint(equalToConstant: 100  ),
            
            self.ListScreen.topAnchor.constraint(equalTo: headerViews.bottomAnchor,constant: 20),
            self.ListScreen.leftAnchor.constraint(equalTo: Transfers.rightAnchor,constant: 20),
            self.ListScreen.heightAnchor.constraint(equalToConstant: 100 ),
            self.ListScreen.widthAnchor.constraint(equalToConstant: 100  ),
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
    
    @objc private func GoTransfers(){
        let nav = TransactionController()
        self.navigationController?.pushViewController(nav, animated: true)
    }
    @objc private func GoList(){
        let nav = ListController()
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
