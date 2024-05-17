//
//  cwButton.swift
//  CardWorkout-Programmtic
//
//  Created by Mihir Kumar on 26/04/24.
//

import UIKit

class cwButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    init(backgroundColor: UIColor, title: String){
    init(color: UIColor, title: String, systemImageName: String  ){
        super.init(frame: .zero)
        
//        self.backgroundColor = backgroundColor
//        setTitle(title, for: .normal)
//        configure()
         
         configuration                       = .tinted()
         configuration?.title                 = title
         configuration?.baseForegroundColor  = color
         configuration?.baseBackgroundColor  = color
         configuration?.cornerStyle          = .capsule
         configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 4
        configuration?.imagePlacement = .trailing 
         
         translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func configure(){
//        layer.cornerRadius = 8
//        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
//        setTitleColor(.white, for: .normal)
//        translatesAutoresizingMaskIntoConstraints = false
//    }
    
}
