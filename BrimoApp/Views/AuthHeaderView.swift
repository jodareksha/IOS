//
//  AuthHeaderView.swift
//  BrimoApp
//
//  Created by Joda Reksa on 06/03/23.
//

import UIKit

class AuthHeaderView: UIView {

    // UI Component

    private lazy var imageViews: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "bri")
        return img
    }()
    private let labels: UILabel = {
        let Labels = UILabel()
        Labels.textColor = .white
        Labels.textAlignment = .center
        Labels.font = .systemFont(ofSize: 26 , weight: .bold)
        Labels.text = "Title"
        return Labels
    }()
    private let subLabel : UILabel = {
        let subLabels = UILabel()
        subLabels.textColor = .white
        subLabels.textAlignment = .center
        subLabels.font = .systemFont(ofSize: 16, weight: .regular)
        subLabels.text = "subText"
        return subLabels
    }()
    
    // LifeCycle
    init(title: String, subTitle: String){
        super.init(frame: .zero)
        self.labels.text = title
        self.subLabel.text = subTitle
        self.setupUI()
    }
    required init?(coder : NSCoder){
        fatalError("init(coder) has not been Implements");
    }
    
    //UI Setup
    private func setupUI(){
        self.addSubview(imageViews)
        self.addSubview(labels)
        self.addSubview(subLabel)
        
        imageViews.translatesAutoresizingMaskIntoConstraints = false
        labels.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //image
            self.imageViews.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor ,constant: 25),
            self.imageViews.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageViews.widthAnchor.constraint(equalToConstant: 90),
            self.imageViews.heightAnchor.constraint(equalTo: imageViews.widthAnchor),
            //label top
            self.labels.topAnchor.constraint(equalTo: imageViews.bottomAnchor, constant: 10),
            self.labels.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labels.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //sub label
            self.subLabel.topAnchor.constraint(equalTo: labels.bottomAnchor,constant: 15),
            self.subLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
        
        
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

}
