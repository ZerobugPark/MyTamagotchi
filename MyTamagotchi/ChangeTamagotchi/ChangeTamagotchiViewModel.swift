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
 
    let description: [String] = [
        """
        "따끔따끔 다마고치"는 다소 독특한 성격을 가진 선인장 같은 다마고치입니다. 
        이 친구는 가끔씩 따끔하게 충전이 필요하지만, 
        그만큼 귀여운 모습과 재미있는 행동으로 사랑을 받아요. 
        손길이 필요할 때마다 다가가면, 마음을 열고 더 가까워질 수 있답니다!
        """,
        """
        "방실방실 다마고치"는 항상 웃음이 넘치는 즐거운 성격을 가진 다마고치입니다. 
        이 친구는 언제나 활짝 웃으며 주위를 밝게 만드는 존재로, 그 에너지를 받아들이면 기분이 좋아져요. 
        조금만 돌봐주면, 귀엽고 사랑스러운 미소를 보답해 줄 거예요!
        """,
        """
        "반짝반짝 다마고치"는 언제나 반짝이는 눈빛과 환한 미소로 주변을 밝혀주는 다마고치입니다. 
        이 친구는 항상 반짝이는 것들을 좋아해서, 작은 변화에도 기뻐하고 신나하는 모습을 보여줘요. 
        그 빛나는 매력을 통해, 당신에게도 따뜻한 에너지를 선사할 거예요!
        """
    ]

    let disposeBag = DisposeBag()
    
    init() {
        print("ChangeTamagotchiViewModel Init")
        
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
                message = owner.description[value.item]
                status = false
            case 1:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                message = owner.description[value.item]
                status = false
            case 2:
                image = ImageSet.tamagotchiImageList[value.item][imageIndex]
                message = owner.description[value.item]
                status = false
            default:
                image = ImageSet.noImage
                message = ""
                status = true
            }
            
            let nameTitle = owner.originalData[value.item].nameTitle
            
            let tamagotchi = (TamagotchiInfo(nameTitle: nameTitle, image: image, description: message),status)
            
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
        
        let imageIndex = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        let nameTitle = ["따끔따금 다마고치" , "방실방실 다마고치", "반짝반짝 다마고치", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요",
                                   "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요", "준비중이에요"]
        
        for i in 0..<nameTitle.count {
            let tamagotchi = Tamagotchi(imageIndex: imageIndex[i], nameTitle: nameTitle[i])
            
            originalData.append(tamagotchi)
            
        }
        
        
    }
}
