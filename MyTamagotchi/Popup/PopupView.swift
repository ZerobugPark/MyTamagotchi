//
//  PopupView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

import SnapKit

final class PopupView: BaseView {

    
    private let view = CustomView(radius: 5.0, color: TamagotchiColor.background)

    private let lineView = CustomView(color: TamagotchiColor.basic)
    private let subLineView = CustomView(color: TamagotchiColor.basic)
    
    
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: true, fontSize: 15)
    let descriptionLabel = CustomLabel(numberOfLine: 0)
    
    let stackView = UIStackView()
    let cancelButton = CustomButton(title: "취소")
    let confirmButton = CustomButton(title: "확인")
    
    override func configureHierarchy() {
        
        addSubview(view)
        view.addSubview(tamagotchiImage)
        view.addSubview(title)
        view.addSubview(lineView)
        view.addSubview(descriptionLabel)
        
        view.addSubview(subLineView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(confirmButton)
    }
    
    override func configureLayout() {
        
        view.snp.makeConstraints { make in
            make.center.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.2)
            make.height.equalTo(self.snp.height).multipliedBy(1.0 / 2.0)
        }
        
        tamagotchiImage.snp.makeConstraints { make in
            make.size.equalTo(view.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalTo(self)
            make.top.equalToSuperview().offset(44)
            
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImage.snp.bottom).offset(8)
            make.centerX.equalTo(view)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(16)
            make.width.equalTo(view.snp.width).multipliedBy(1.0 / 1.5)
            make.height.equalTo(1)
            make.centerX.equalTo(view)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(16)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.5)
            make.centerX.equalTo(view)
            make.bottom.lessThanOrEqualTo(subLineView.snp.top).offset(-8)
        }
        
        subLineView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).offset(-1)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        
        
    }
    
    override func configureView() {
        
        // 백그라운드가 컬러가 있으면, overCurrentContext기준으로 전체화면
        // clear 일 때는, addSubview한 뷰의 크기 기준
        // clear 할 때는 기본 뷰 자체가 hierarchy에 들어있지 않음
        self.backgroundColor = .black
        
        //스토리보드의 Opacity와 같은 역할
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        
        descriptionLabel.text = """
                                sndkandksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml
                                dksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml
                                andksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml
                                andksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml
                                andksamdklsdsadadsadamdklamkdlmkdlmakldmskaldml
                                """
        
        DispatchQueue.main.async {
            self.tamagotchiImage.layer.cornerRadius = self.tamagotchiImage.frame.width / 2
        }
        
        
        tamagotchiImage.image = ImageSet.tamagotchiImageList[0][0]
        title.text = "테스트입니다"
    }
    
}
