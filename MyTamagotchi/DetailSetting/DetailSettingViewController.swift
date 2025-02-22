//
//  DetailSettingViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import RxSwift
import RxCocoa


class DetailSettingViewController: UIViewController {

    
    private let detailView = DetailSettingView()
    
    var viewModel = DetailSettingViewModel()
    
    struct TableViewInfo {
        let title: String
        let subtitle: String
        let image: String
        
    }
    
    override func loadView() {
        view = detailView
    }

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailSettingCell")
        
        configurationNavigation()
        bind()
 
        
    }
    
    private func bind() {
        let input = DetailSettingViewModel.Input()
        let output = viewModel.transform(input: input)
        
      
        output.data.asDriver(onErrorJustReturn: []).drive(detailView.tableView.rx.items(cellIdentifier: "DetailSettingCell", cellType: UITableViewCell.self)) { row, element, cell in
            // 셀 스타일 설정
            
            cell.textLabel?.text = element.title
            cell.textLabel?.textColor = TamagotchiColor.basic
            
            cell.detailTextLabel?.text = element.subtitle
            cell.detailTextLabel?.textColor = TamagotchiColor.basic
            
            cell.backgroundColor = TamagotchiColor.background
            cell.tintColor = TamagotchiColor.basic
            
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none // 하이라이트 제거
            
        }.disposed(by: disposeBag)



        detailView.tableView.rx.itemSelected.bind(with: self) { onwer, test in
            print(test)
        }.disposed(by: disposeBag)
        
  
     

          
    }

    private func configurationNavigation() {
        navigationItem.title = "설정"
    }
    

    deinit {
        print("DetailSettingViewController Deinit")
    }
}



extension DetailSettingViewController {
    
    
}
