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

    }
    
    struct Output {
  
    }

    

    
    let disposeBag = DisposeBag()
    
    init() {
        print("ChangeNameViewModel Init")
    }
    
    func transform(input: Input) -> Output {
     


        

        return Output()
    }
                
  
    
    deinit {
        print("ChangeNameViewModel DeInit")
    }
}
