//
//  PlayView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

import SnapKit

final class PlayView: BaseView {

    private let talkIamgeView = UIImageView()
    private let lineView = CustomView(color: TamagotchiColor.basic)
    private let subLineView = CustomView(color: TamagotchiColor.basic)
    
    
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: true, fontSize: 15)
    let levelLabel = CustomLabel(boldStyle: true)
    let riceLabel = CustomLabel(boldStyle: true)
    let waterLabel = CustomLabel(boldStyle: true)
    
    private let dotLabel = CustomLabel(boldStyle: true)
    private let dot2Label = CustomLabel(boldStyle: true)
    private let stackView = UIStackView()
    
    let descriptionLabel = CustomLabel(numberOfLine: 0)
    
    let riceTextField = CustomTextField(placeholderText: "밥주세용")
    let waterTextField = CustomTextField(placeholderText: "물주세용")
    
    let riceButton = CustomButton(title: "밥먹기", image: "leaf.circle")
    let waterButton = CustomButton(title: "물먹기", image: "drop.circle")


    override func configureHierarchy() {
   
       addSubview(talkIamgeView)
        talkIamgeView.addSubview(descriptionLabel)
        
        [tamagotchiImage, title, stackView].forEach {
            addSubview($0)
        }
        
        [levelLabel, dotLabel, riceLabel, dot2Label, waterLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [riceTextField, waterButton, lineView, waterTextField, riceButton, subLineView].forEach {
            addSubview($0)
        }
        
 
        
  
    }
    
    override func configureLayout() {
        
        talkIamgeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tamagotchiImage.snp.top).offset(-16)
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 1.5)
            make.height.equalTo(self.snp.width).multipliedBy(1.0 / 2.5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(1.0 / 1.4)
        }
        
        tamagotchiImage.snp.makeConstraints { make in
            make.size.equalTo(self.snp.width).multipliedBy(1.0 / 1.8)
            make.centerX.equalTo(self)
            make.bottom.equalTo(title.snp.top).offset(-8)
            
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(stackView.snp.top).offset(-8)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(riceTextField.snp.top).offset(-16)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalToSuperview().offset(-50)
            make.bottom.equalTo(lineView.snp.top).offset(-4)
        }
        
        lineView.snp.makeConstraints { make in
        
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalToSuperview().offset(-50)
            make.height.equalTo(1)
            make.bottom.equalTo(waterTextField.snp.top).offset(-15)
            
        }
        
        riceButton.snp.makeConstraints { make in
            make.leading.equalTo(riceTextField.snp.trailing).offset(10)
            make.bottom.equalTo(waterButton.snp.top).offset(-10)
        }
        
        waterTextField.snp.makeConstraints { make in
        
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalToSuperview().offset(-50)
            make.bottom.equalTo(subLineView.snp.top).offset(-4)

        }
        
        subLineView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(1.0 / 3.0)
            make.centerX.equalToSuperview().offset(-50)
            make.height.equalTo(1)
            make.bottom.equalTo(self.keyboardLayoutGuide.snp.top).offset(-100)
            
        }
        
        waterButton.snp.makeConstraints { make in
            make.leading.equalTo(waterTextField.snp.trailing).offset(10)
            make.bottom.equalTo(self.keyboardLayoutGuide.snp.top).offset(-100)
        }
        
        
    }
    
    override func configureView() {
        self.backgroundColor = TamagotchiColor.background
    
 
        talkIamgeView.image = UIImage(resource: .bubble)
        tamagotchiImage.image = ImageSet.tamagotchiImageList[0][0]
        title.text = TamagotchiName.nameTitle[UserDefaultManager.character]
        
      //  descriptionLabel.text = "\(TamagotchiMessageList.messageList.randomElement()!) 대장님"
                                
        
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        
        
        dotLabel.text = "⋅"
        dot2Label.text = "⋅"
        
        DispatchQueue.main.async {
            self.tamagotchiImage.layer.cornerRadius = self.tamagotchiImage.frame.width / 2
        }
    }
    
    
}
