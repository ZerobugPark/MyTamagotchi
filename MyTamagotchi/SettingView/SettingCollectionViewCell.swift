//
//  SettingCollectionViewCell.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

class SettingCollectionViewCell: BaseCollectionViewCell {
    
    static let id = "SettingCollectionViewCell"
    
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: false, fontSize: 15)
    
    override func configureHierarchy() {
        contentView.addSubview(tamagotchiImage)
        contentView.addSubview(title)
        
    }
    
    override func configureLayout() {
        
        tamagotchiImage.snp.makeConstraints { make in
            make.size.equalTo(contentView.snp.width).multipliedBy(1.0 / 1.3)
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImage.snp.bottom).offset(4)
            make.centerX.equalTo(contentView)
            make.width.greaterThanOrEqualTo(30)
            make.height.equalTo(18)
            
        }
        
    }
    
    override func configureView() {
        
 
        
    }
    
    // 뷰의 프레임이 변경될 때 마다 호출
    override func layoutSubviews() {
        super.layoutSubviews()
        guard contentView.bounds.width > 0 else { return }
        
        tamagotchiImage.layer.cornerRadius = tamagotchiImage.frame.width / 2
    
    }
    
    func setup(info: TamagotchiInfo, index: Int) {
        
        
//        switch index {
//        case 0:
//            tamagotchiImage.image = ImageSet.tamagochiImageList[index][0]
//        case 1:
//        case 2:
//        default
//            
//        }
        
        
        
        
        
       // title.text = info.nameTitle[index]
        
        contentView.layoutIfNeeded()
    }
    
}
