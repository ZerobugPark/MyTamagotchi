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
        let saveData: PublishRelay<Void>
    }
    
    struct Output {
        let info: Observable<(TamagotchiInfo, Bool)>

        
    }

    var tamagotchiInfo: (TamagotchiInfo, Bool)?
    
    private let disposeBag = DisposeBag()

    init() {
        print("PopupViewModel Init")
    }
    
    func transform(input: Input) -> Output {
     
        let info = getInfo(info: tamagotchiInfo)
        
        input.saveData.asDriver(onErrorJustReturn: ()).drive(with: self) { owner, _ in
            
            UserDefaultManager.isSave = true
            UserDefaultManager.character = owner.tamagotchiInfo!.0.character
            
        }.disposed(by: disposeBag)
        
        return Output(info: info)
    }
                
  
    
    deinit {
        print("PopupViewModel DeInit")
    }
}

// MARK: - Custom Observable
extension PopupViewModel {
    
    private func getInfo(info: (TamagotchiInfo, Bool)?) -> Observable<(TamagotchiInfo, Bool)> {
        
        return Observable<(TamagotchiInfo, Bool)>.create { value in
            
            if let tamagotchi = info {
                value.onNext(tamagotchi)
                value.onCompleted()
            } else {
                let description = "오류입니다."
                let info = TamagotchiInfo(nameTitle: "Unknown", image: ImageSet.noImage, description: description, character: 0)
                let tamagotchi: (TamagotchiInfo, Bool) = (info, true)
                value.onNext(tamagotchi)
                value.onCompleted()
            }
            
            
            return Disposables.create()
        }
        
    }
    
}




