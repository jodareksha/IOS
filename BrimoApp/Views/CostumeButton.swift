//
//  CostumeButton.swift
//  BrimoApp
//
//  Created by Joda Reksa on 06/03/23.
//

import UIKit

class CostumeButton: UIButton {

    enum FontSizes {
        case big
        case med
        case sm
    }

    init(title: String, hasBackground: Bool = false, fontSize : FontSizes) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemBlue : .clear
        
        let titleColors : UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColors, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        case .sm:
            self.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        }
        
    }
    
    required init?(coder : NSCoder){
        fatalError("init(coder) has not been Implements");
    }
}
