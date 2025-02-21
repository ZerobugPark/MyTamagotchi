//
//  SettingViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit


import RxSwift
import RxCocoa

final class SettingViewModel: BaseViewModel {
        
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
        print("SettingViewModel Init")
        
        loadData()
    }
    
    func transform(input: Input) -> Output {
        
        let tamagotchiInfo = PublishSubject<(TamagotchiInfo, Bool)>()
        
        input.itemSelected.bind(with: self) { owner, value in
            var status = false
            
            //직접 설정하는 것이아닌, 다른 뷰로 전달 할 때에는 모델 뷰에서 해주는게 맞지 않을까?
            //단순 UIkit을 import 안해야지가 아닌듯..
            var image: UIImage
            
            let imageIndex = owner.originalData[value.item].imageIndex
            switch value.item {
            case 0:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                status = false
            case 1:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                status = false
            case 2:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                status = false
            default:
                image = ImageSet.noImage
                status = true
            }
            
            let nameTitle = owner.originalData[value.item].nameTitle
            let tamagotchi = (TamagotchiInfo(nameTitle: nameTitle, image: image),status)
            
            tamagotchiInfo.onNext(tamagotchi)
            
        }.disposed(by: disposeBag)
        
  
     
        
        let tamagotchiList = BehaviorRelay(value: originalData)
        
        
        return Output(tamagotchiList: tamagotchiList, tamagotchiInfo: tamagotchiInfo)
    }
    
    deinit {
        print("SettingViewModel DeInit")
    }
}


extension SettingViewModel {
    
    
    private func loadData() {
        
        let imageIndex = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        let nameTitle = ["따끔따금 다마고치" , "방실 방실 다마고치", "반짝 반짝 다마고치", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요"]
        
        for i in 0..<nameTitle.count {
            let tamagotchi = Tamagotchi(imageIndex: imageIndex[i], nameTitle: nameTitle[i])
            
            originalData.append(tamagotchi)
            
        }
        
        
    }
}
