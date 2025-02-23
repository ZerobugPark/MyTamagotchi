//
//  ChangeTamagotchiViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import RxSwift
import RxCocoa


final class ChangeTamagotchiViewModel: BaseViewModel {
   
    struct Input {
        let itemSelected: ControlEvent<IndexPath>
        
    }
    
    struct Output {
        let tamagotchiList: BehaviorRelay<[Tamagotchi]>
        let tamagotchiInfo: PublishSubject<(TamagotchiInfo, Bool)>
        
    }

    private var originalData: [Tamagotchi] = []
 
    let disposeBag = DisposeBag()
    
    init() {
        print("ChangeTamagotchiViewModel Init")
        
        loadData()
    }
    
    func transform(input: Input) -> Output {
        
        let tamagotchiInfo = PublishSubject<(TamagotchiInfo, Bool)>()
        
        input.itemSelected.bind(with: self) { owner, value in
            var status = false
            
    
            var image: UIImage
            var message: String
            
            let imageIndex = owner.originalData[value.item].imageIndex
            switch value.item {
            case 0:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                message = TamagotchiMessageList.description[value.item]
                status = false
            case 1:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                message = TamagotchiMessageList.description[value.item]
                status = false
            case 2:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                message = TamagotchiMessageList.description[value.item]
                status = false
            default:
                image = ImageSet.noImage
                message = ""
                status = true
            }
            
            let nameTitle = owner.originalData[value.item].nameTitle
            
            let tamagotchi = (TamagotchiInfo(nameTitle: nameTitle, image: image, description: message, character: value.item),status)
            
            tamagotchiInfo.onNext(tamagotchi)
            
        }.disposed(by: disposeBag)
        
  
     
        
        let tamagotchiList = BehaviorRelay(value: originalData)
        
        
        return Output(tamagotchiList: tamagotchiList, tamagotchiInfo: tamagotchiInfo)
    }
    
    deinit {
        print("ChangeTamagotchiViewModel DeInit")
    }
}



extension ChangeTamagotchiViewModel {

    private func loadData() {
        
        var imageIndex = [8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
   
        
        for i in 0..<2 {
            let riceCount = UserDefaultManager.characterInfo[i][0]
            let waterCount = UserDefaultManager.characterInfo[i][1]
            let level = calculatorTamagotchiLevel(riceCount: riceCount, waterCount: waterCount)
            imageIndex[i] = findImageIndex(level: level)
        }
    
    
        let nameTitle = ["따끔따금 다마고치" , "방실방실 다마고치", "반짝반짝 다마고치", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요"]
        
        for i in 0..<nameTitle.count {
            let tamagotchi = Tamagotchi(imageIndex: imageIndex[i], nameTitle: nameTitle[i])
            
            originalData.append(tamagotchi)
            
        }
        
        
    }
    
    private func calculatorTamagotchiLevel(riceCount: Int, waterCount: Int) -> Int {
        
        let sum = (riceCount / 5) + (waterCount / 2)
        var level = sum / 10
        
        if level >= 10 {
            level = 10
        } else if level == 0 {
            level = 1
        }
        
        return level
    }
    
    
    private func findImageIndex(level: Int) -> Int {
        
        var imageIndex = level - 1
        
        if imageIndex >= 9 {
            imageIndex = 8
        }
        
        return imageIndex
        
    }
    
}
