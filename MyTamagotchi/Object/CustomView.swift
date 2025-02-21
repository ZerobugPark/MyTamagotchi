//
//  CustomView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit



class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init(radius: CGFloat = 0, color: UIColor) {
        self.init(frame: .zero)
        
        self.backgroundColor = color
        
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
