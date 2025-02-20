//
//  CustomImageView.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

final class CustomImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
     
        layer.borderColor = TamagotchiColor.basic.cgColor
        layer.borderWidth = 5
        clipsToBounds = true
        contentMode = .scaleToFill
    }

    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
