//
//  SettingCollectionViewCell.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

class SettingCollectionViewCell: BaseCollectionViewCell {
    
    static let id = "SettingCollectionViewCell"
    
    let tamagotchiImage = CustomImageView()
    let title = CustomLabel(boldStyle: true, fontSize: 13)
    
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
            make.top.equalTo(tamagotchiImage.snp.bottom).offset(8)
            make.centerX.equalTo(contentView)
            
            
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
        
        
        switch index {
        case 0:
            tamagotchiImage.image = ImageSet.tamagotchiImageList[0][info.imageIndex]
        case 1:
            tamagotchiImage.image = ImageSet.tamagotchiImageList[1][info.imageIndex]
        case 2:
            tamagotchiImage.image = ImageSet.tamagotchiImageList[2][info.imageIndex]
        default:
            tamagotchiImage.image = ImageSet.noImage
            
        }
        
        title.text = info.nameTitle
        
        contentView.layoutIfNeeded()
    }
    
}
