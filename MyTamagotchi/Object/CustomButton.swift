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
    
    //    convenience init(title: String){
    //        self.init()
    //        configuration = .BasicButtonStyle(title: title)
    //
    //        titleLabel?.font = .systemFont(ofSize: 16)
    //        clipsToBounds = true
    //
    //     }
    
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
        
        
        
        // 클릭(하이라이트) 상태일 때 배경색 변경
        //configuration.background.highlightedBackgroundColor =  // 클릭했을 때 배경색 변경
        
        
        
        
        configuration.background.strokeWidth =  0 // 테두리 굵기
        configuration.cornerStyle = .large
        
        configuration.buttonSize = .large
        
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
