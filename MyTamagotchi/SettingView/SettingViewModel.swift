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


    private let disposeBag = DisposeBag()
    
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
        print("SettingViewModel DeInit")
    }
}


extension SettingViewModel {

    private func loadData() {
        
        let imageIndex = [8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

        
        for i in 0..<TamagotchiName.nameTitle.count {
            let tamagotchi = Tamagotchi(imageIndex: imageIndex[i], nameTitle: TamagotchiName.nameTitle[i])
            
            originalData.append(tamagotchi)
            
        }
        
        
    }
}
