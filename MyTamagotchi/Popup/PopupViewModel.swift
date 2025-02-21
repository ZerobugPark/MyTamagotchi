//
//  PopupViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import Foundation

import RxSwift
import RxCocoa

final class PopupViewModel: BaseViewModel {
        
    
    
    struct Input {
        
    }
    
    struct Output {
       // let info: Observable<(TamagotchiInfo, Bool)>
    }

    var tamagotchiInfo: (TamagotchiInfo, Bool)?
    
    

    init() {
        print("SettingViewModel Init")
    }
    
    func transform(input: Input) -> Output {
     
        return Output()
    }
                
  
    
    deinit {
        print("SettingViewModel DeInit")
    }
}




