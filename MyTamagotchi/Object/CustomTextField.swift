//
//  CustomTextField.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit



final class CustomTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        layer.borderWidth = 0
        textColor = TamagotchiColor.basic
        font = .systemFont(ofSize: 13)
    }
    
    
    convenience init(placeholderText: String) {
        self.init()
        
        placeholder = placeholderText
        textAlignment = .center
        keyboardType = .numberPad
  
    }
    
    
    
    
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
