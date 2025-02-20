//
//  CustomLabel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

final class CustomLabel: UILabel {
    
    private let padding = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
    
    init() {
        super.init(frame: .zero)
    }
    
    convenience init(boldStyle: Bool, fontSize: CGFloat) {
        self.init()
        font = boldStyle ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        textColor = TamagotchiColor.basic
        textAlignment = .center
        layer.borderWidth = 1
        layer.borderColor = TamagotchiColor.basic.cgColor
        layer.cornerRadius = 2
        clipsToBounds = true
        
    }
    
    // 텍스트 내의 패딩
    override func drawText(in rect: CGRect) {
        
        super.drawText(in: rect.inset(by: padding))
    }
    
    // 텍스트레이블의 사이즈를 패딩을 더해서 다시 정의해줌
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
