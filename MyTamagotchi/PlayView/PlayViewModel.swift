//
//  PlayViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

import RxSwift
import RxCocoa


final class PlayViewModel: BaseViewModel {
    
    
    
    struct Input {
        let rice: Observable<ControlProperty<String>.Element>
        let water: Observable<ControlProperty<String>.Element>
        let profileButtonTapped: SharedSequence<DriverSharingStrategy, ()>
    }
    
    struct Output {
        let myTamagotchi: BehaviorRelay<(String, String, String, String, String, (Int, Int))>
        let errorMessage: PublishRelay<String>
        let profileButtonTapped: PublishRelay<String>
        let riceTextFieldClear: PublishRelay<Void>
        let waterTextFieldClear: PublishRelay<Void>
    }

    

    
    private let disposeBag = DisposeBag()
    
    private var myTamagotchiExp: (Int, Int) = (0,0)
    
    // 이름, Lv, 밥, 쌀, 메시지, 이미지 인덱스(,)
    private var myTamagotchi: (String, String, String, String, String, (Int,Int)) = ("", "", "", "", "", ((0, 0)))
    
    init() {
        print("PlayViewModel Init")
        loadData()
    }
    
    func transform(input: Input) -> Output {
        
        let myTamagotchiInfo = BehaviorRelay(value: myTamagotchi)
        let errorMsg = PublishRelay<String>()
        let buttonTap = PublishRelay<String>()
        
        let riceTextFieldClear = PublishRelay<()>()
        let waterTextFieldClear = PublishRelay<()>()

        input.rice.bind(with: self) { owner, str in
            let maxRice = 99
            
            guard let rice = Int(str) else {
                let msg = "숫자만 입력해주세요"
                errorMsg.accept(msg)
                return
            }
            
            if rice > maxRice {
                let msg = "최대 99개입니다."
                errorMsg.accept(msg)
                return
            }

            
            let sendData  = owner.tamagotchiInfo(rice: rice)
            myTamagotchiInfo.accept(sendData)
            riceTextFieldClear.accept(())
                                                 
        }.disposed(by: disposeBag)
        
        input.water.bind(with: self) { owner, str in
            let maxWater = 49
            
            guard let water = Int(str) else {
                let msg = "숫자만 입력해주세요"
                errorMsg.accept(msg)
                return
            }
            
            if water > maxWater {
                let msg = "최대 49개입니다."
                errorMsg.accept(msg)
                return
            }
            

            
            let sendData  = owner.tamagotchiInfo(water: water)
            myTamagotchiInfo.accept(sendData)
            waterTextFieldClear.accept(())
        }.disposed(by: disposeBag)
        
        
        
        input.profileButtonTapped.drive(with: self) { owner, _ in
           
            buttonTap.accept(owner.myTamagotchi.0)
        }.disposed(by: disposeBag)
        
        
        NotificationCenter.default.rx.notification(.nickName).compactMap {
            $0.userInfo?["nickname"] as? String}
        .asDriver(onErrorJustReturn: "").drive(with: self) { owner, name in
            
            
            owner.myTamagotchi.0 = name
        
            let character = UserDefaultManager.character
            UserDefaultManager.characterName[character][0] = name
            
            let sendData  = owner.tamagotchiInfo()
            myTamagotchiInfo.accept(sendData)
            
        }.disposed(by: disposeBag)
        
        

        return Output(myTamagotchi: myTamagotchiInfo, errorMessage: errorMsg, profileButtonTapped: buttonTap, riceTextFieldClear: riceTextFieldClear,waterTextFieldClear: waterTextFieldClear)
    }
                
  
    
    deinit {
        print("PlayViewModel DeInit")
    }
}


extension PlayViewModel {
    
    
    private func tamagotchiInfo(rice: Int = 0, water: Int = 0 ) -> (name: String, lv: String, rice: String, water: String, description: String, image: (Int,Int)) {
        
        let totalRice = myTamagotchiExp.0 + rice
        let totalWater = myTamagotchiExp.1 + water
        
        myTamagotchiExp.0 = totalRice
        myTamagotchiExp.1 = totalWater
        
        UserDefaultManager.characterInfo[UserDefaultManager.character][0] = totalRice
        UserDefaultManager.characterInfo[UserDefaultManager.character][1] = totalWater
        
        
        let level = calculatorTamagotchiLevel(riceCount: totalRice, waterCount: totalWater)
        
        let stringInfo = chageToString(info: (level: level, rice: totalRice, water: totalWater))
        
        let descriptionMsg = randomMessage(name: myTamagotchi.0)
        let image = findImageIndex(level: level)
                

        
        return (myTamagotchi.0, stringInfo.level, stringInfo.rice, stringInfo.water, descriptionMsg, (myTamagotchi.5.0, image))
        
    }
    
    private func loadData() {
        
        let character = UserDefaultManager.character
        let riceCount = UserDefaultManager.characterInfo[character][0]
        let waterCount = UserDefaultManager.characterInfo[character][1]
        let name = UserDefaultManager.characterName[character][0]
        
        
  
        myTamagotchiExp = (riceCount, waterCount)
        let level = calculatorTamagotchiLevel(riceCount: riceCount, waterCount: waterCount)
        
        let stringInfo = chageToString(info: (level: level, rice: riceCount, water: waterCount))
        let descriptionMsg = randomMessage(name: name)
        let image = findImageIndex(level: level)
        
        myTamagotchi = (name, stringInfo.level, stringInfo.rice, stringInfo.water, descriptionMsg, (character, image))
        
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
    
    private func chageToString(info: (level: Int, rice: Int, water: Int)) -> (level: String, rice: String, water: String) {
     
        let level = "Lv\(info.level)"
        let rice = "밥알 \(info.rice)개"
        let water = "물방울 \(info.water)개"
        
        return (level, rice, water)
    }
    
    private func randomMessage(name: String) -> String {
        

        
        let randomNumber = Int.random(in: 0...TamagotchiMessageList.messageList.count-1)
        
        if randomNumber % 2 == 0 {
        
            let msg = "\(TamagotchiMessageList.messageList[randomNumber]) \(name)님"
            return msg
        } else {
            let msg = "\(name)님 \(TamagotchiMessageList.messageList[randomNumber])"
            return msg
        }
        
        
    }
    
    private func findImageIndex(level: Int) -> Int {
        
        var imageIndex = level - 1
        
        if imageIndex >= 9 {
            imageIndex = 8
        }
        
        return imageIndex
        
    }
    

}
