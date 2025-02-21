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
    }
    
    
    convenience init(placeholderText: String) {
        self.init()
        
        layer.borderWidth = 0
        placeholder = placeholderText
        textAlignment = .center
        textColor = TamagotchiColor.basic
        keyboardType = .numberPad
    }
    
    
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
