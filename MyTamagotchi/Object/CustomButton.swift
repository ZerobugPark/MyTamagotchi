//
//  CustomButton.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

final class CustomButton: UIButton {
    
    
    init() {
        super.init(frame: .zero)
        
    }
    
    convenience init(title: String) {
        self.init()
        
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        setTitle(title, for: .normal)
        setTitleColor(TamagotchiColor.basic, for: .normal)
        setTitleColor(TamagotchiColor.basic, for: .highlighted)
        
        setBackgroundColor(#colorLiteral(red: 0.8907780647, green: 0.9307019114, blue: 0.9386151433, alpha: 1), for: .highlighted)
        setBackgroundColor(TamagotchiColor.background , for: .normal)
        
        
    }
    
    convenience init(title: String, image: String){
        self.init()
        configuration = .imageButtonStyle(title: title, image: image)
        
        titleLabel?.font = .systemFont(ofSize: 16)
        clipsToBounds = true
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


@available (iOS 15.0, *)
extension CustomButton.Configuration {
    
    static func selectedButtonStyle(title: String) -> UIButton.Configuration {
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.baseForegroundColor = TamagotchiColor.basic  // 텍스트 컬러
        configuration.baseBackgroundColor = TamagotchiColor.background // 배경 컬러
        
        
        configuration.background.strokeWidth =  0 // 테두리 굵기
        configuration.cornerStyle = .large
        
        configuration.buttonSize = .large
        
        return configuration
    }
    
    static func imageButtonStyle(title: String, image: String) -> UIButton.Configuration {
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.titleAlignment = .leading
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 8, weight: .thin)
        configuration.image = UIImage(systemName: image, withConfiguration: imageConfig)
        
        configuration.baseForegroundColor = TamagotchiColor.basic
        configuration.baseBackgroundColor = TamagotchiColor.background
        
        configuration.background.strokeColor =  TamagotchiColor.basic
        configuration.background.strokeWidth = 1
        
        configuration.cornerStyle = .medium
        configuration.buttonSize = .small
        configuration.imagePadding = 5
        
        return configuration
    }
}

// MARK: - Background Color 지정
extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
    
}
