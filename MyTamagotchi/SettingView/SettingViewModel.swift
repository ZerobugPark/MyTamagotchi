//
//  SettingViewModel.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import Foundation


import RxSwift
import RxCocoa

final class SettingViewModel: BaseViewModel {
    
    
    
    
    struct Input {
        
    }
    
    struct Output {
        let tamagotchiList: BehaviorRelay<[TamagotchiInfo]>
    }
    
   
  
    private var originalData: [TamagotchiInfo] = []
  
    
    
    
    
    init() {
        print("SettingViewModel Init")
        
        loadData()
    }
    
    
    
    func transform(input: Input) -> Output {
        
        let tamagotchiList = BehaviorRelay(value: originalData)
        
        
        return Output(tamagotchiList: tamagotchiList)
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
            let tamagochi = TamagotchiInfo(imageIndex: imageIndex[i], nameTitle: nameTitle[i])
            
            originalData.append(tamagochi)
            
        }
        
        
    }
}
