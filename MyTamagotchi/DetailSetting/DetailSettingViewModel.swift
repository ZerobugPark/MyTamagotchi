//
//  DetailSettingViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import Foundation


import RxSwift
import RxCocoa

final class DetailSettingViewModel: BaseViewModel {
    
    struct Input {
        let seletecd: SharedSequence<DriverSharingStrategy, IndexPath>
        let confirm: PublishSubject<Void>
    }
    
    struct Output {
        let data: BehaviorRelay<[TableViewInfo]>
        let changedName: PublishRelay<String>
        let changedTamagotchi: PublishRelay<String>
        let resetData: PublishRelay<[String]>
    }

    
    var tableViewData: [TableViewInfo] = []
    
    let disposeBag = DisposeBag()
    
    init() {
        print("DetailSettingViewModel Init")
        loadData()
    }
    
    func transform(input: Input) -> Output {
     
        let data = BehaviorRelay(value: tableViewData)
        let changedName = PublishRelay<String>()
        let changedTamagotchi = PublishRelay<String>()
        let resetData = PublishRelay<[String]>()
         
        input.confirm.bind(with: self) { owner, _ in
            print("확인 버튼 클릭됨")
            
            
        }.disposed(by: disposeBag)
        
        input.seletecd.drive(with: self) { owner, indexPath in
            
            switch indexPath.row {
            case 0:
                changedName.accept("텍스트")
                
                
            case 1:
                changedTamagotchi.accept("텍스트")
            case 2:
                let title = "데이터 초기화"
                let msg = "정말 다시 처음부터 시작하실 건가요"
                resetData.accept([title, msg])
            default:
                print("")
            }
            
        }.disposed(by: disposeBag)
        
        

        return Output(data: data, changedName: changedName, changedTamagotchi: changedTamagotchi, resetData: resetData)
    }
                
  
    
    deinit {
        print("DetailSettingViewModel DeInit")
    }
}


extension DetailSettingViewModel {
    
    
    struct TableViewInfo {
        let title: String
        let subtitle: String
        let image: String
        
    }
    
    private func loadData() {
        
        let title: [String] = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
        let subTitle: [String] = ["테스트입니다.", "", ""]
        let image: [String] = ["pencil", "moon.fill", "arrow.clockwise"]
        
        for i in 0..<title.count {
            let info = TableViewInfo(title: title[i], subtitle: subTitle[i], image: image[i])
            tableViewData.append(info)
        }
    }
    
}
