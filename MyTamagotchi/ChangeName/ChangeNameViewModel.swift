//
//  ChangeNameViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import Foundation

import RxSwift
import RxCocoa

final class ChangeNameViewModel: BaseViewModel {
    
    struct Input {
        let saveButtonTapped: Observable<ControlProperty<String>.Element>
    }
    
    struct Output {
  
        let tamagotchiName: Observable<String>
        let saveButtonTapped: PublishRelay<Void>
    }

    var tamagotchiName: String = ""

    
    let disposeBag = DisposeBag()
    
    init() {
        print("ChangeNameViewModel Init")

    }
    
    func transform(input: Input) -> Output {
     
        let name = Observable.just(tamagotchiName)
        let saveButtonTapped = PublishRelay<Void>()
        
        input.saveButtonTapped.bind(with: self) { owner, text in
            
            if text.isEmpty {
                return
            }
            
            NotificationCenter.default.post(name: .nickName, object: nil, userInfo: ["nickname" : text])
            
            saveButtonTapped.accept(())
        }.disposed(by: disposeBag)

        return Output(tamagotchiName: name, saveButtonTapped: saveButtonTapped)
    }
                

    deinit {
        print("ChangeNameViewModel DeInit")
    }
}
