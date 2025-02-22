//
//  DetailSettingViewModel.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import Foundation


import RxSwift
import RxCocoa

class DetailSettingViewModel: BaseViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let data: BehaviorRelay<[TableViewInfo]>
        
    }

  
    
    
    var tableViewData: [TableViewInfo] = []
    

    init() {
        print("DetailSettingViewModel Init")
        loadData()
    }
    
    func transform(input: Input) -> Output {
     
        let data = BehaviorRelay(value: tableViewData)
         

        return Output(data: data)
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
