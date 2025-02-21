//
//  PopupView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

final class PopupView: BaseView {

    
    private let view = CustomView(radius: 5.0, color: TamagotchiColor.background)

    private let lineView = CustomView(color: TamagotchiColor.basic)
    
    
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: true, fontSize: 15)
    let descriptionLabel = CustomLabel(numberOfLine: 0)
    
    let stackView = UIStackView()
    let cancelButton = UIButton()
    let confirmButton = UIButton()
    
    override func configureHierarchy() {
        
        addSubview(view)
        view.addSubview(tamagotchiImage)
        view.addSubview(title)
        view.addSubview(lineView)
        view.addSubview(descriptionLabel)
    }
    
    override func configureLayout() {
        
        view.snp.makeConstraints { make in
            make.center.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.2)
            make.height.equalTo(self.snp.height).multipliedBy(1.0 / 2.0)
        }
        
        tamagotchiImage.snp.makeConstraints { make in
            make.size.equalTo(self.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalTo(self)
            make.top.equalToSuperview().offset(44)
            
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImage.snp.bottom).offset(8)
            make.centerX.equalTo(view)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(16)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.8)
            make.height.equalTo(1)
            make.centerX.equalTo(view)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(16)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.5)
            make.centerX.equalTo(view)
        }
        
    }
    
    override func configureView() {
        
        // 백그라운드가 컬러가 있으면, overCurrentContext기준으로 전체화면
        // clear 일 때는, addSubview한 뷰의 크기 기준
        // clear 할 때는 기본 뷰 자체가 hierarchy에 들어있지 않음
        self.backgroundColor = .black
        
        //스토리보드의 Opacity와 같은 역할
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    
        //lineView.backgroundColor = TamagotchiColor.basic
        
        
        descriptionLabel.text = "sndkandksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml"
        
        
        tamagotchiImage.image = ImageSet.tamagotchiImageList[0][0]
        title.text = "테스트입니다"
    }

}
