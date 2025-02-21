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
        let info: Observable<(Tamagotchi, Bool)>
    }

    var tamagotchiInfo: (Tamagotchi, Bool)?
    
    

    init() {
        print("SettingViewModel Init")
    }
    
    func transform(input: Input) -> Output {
     
        let info = getInfo(info: tamagotchiInfo)
        
        return Output(info: info)
    }
                
  
    
    deinit {
        print("SettingViewModel DeInit")
    }
}

// MARK: - Custom Observable
extension PopupViewModel {
    
    private func getInfo(info: (Tamagotchi, Bool)?) -> Observable<(Tamagotchi, Bool)> {
        
        return Observable<(Tamagotchi, Bool)>.create { value in
            
            if let tamagotchi = info {
                value.onNext(tamagotchi)
                value.onCompleted()
            } else {
                var info = Tamagotchi(imageIndex: 0, nameTitle: "잘못된 값")
                let tamagotchi: (Tamagotchi, Bool) = (info, true)
                value.onNext(tamagotchi)
                value.onCompleted()
            }
            
            
            return Disposables.create()
        }
        
    }
    
}




