//
//  DetailSettingView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

final class DetailSettingView: BaseView {
    
    let tableView = UITableView()


    override func configureHierarchy() {
   
       addSubview(tableView)
  
    }
    
    override func configureLayout() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
    
        }
            
    }
    
    override func configureView() {
        self.backgroundColor = TamagotchiColor.background
        tableView.backgroundColor = TamagotchiColor.background
    }
    
}
