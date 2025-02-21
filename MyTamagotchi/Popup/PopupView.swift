//
//  PopupView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

final class PopupView: BaseView {

    
    let view = UIView()
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: false, fontSize: 15)
    
    let stackView = UIStackView()
    
    override func configureHierarchy() {
        
        
  
        addSubview(view)
    }
    
    override func configureLayout() {
        view.snp.makeConstraints { make in
            make.center.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.2)
            make.height.equalTo(self.snp.height).multipliedBy(1.0 / 2.0)
        }
    }
    
    override func configureView() {
        
        // 백그라운드가 컬러가 있으면, overCurrentContext기준으로 전체화면
        // clear 일 때는, addSubview한 뷰의 크기 기준
        // clear 할 때는 기본 뷰 자체가 hierarchy에 들어있지 않음
        self.backgroundColor = .black
        
        //스토리보드의 Opacity와 같은 역할
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.backgroundColor = TamagotchiColor.background
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
    }

}
