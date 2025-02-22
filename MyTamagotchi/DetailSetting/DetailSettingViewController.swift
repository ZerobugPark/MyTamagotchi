//
//  DetailSettingViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import RxSwift
import RxCocoa


final class DetailSettingViewController: UIViewController {
    
    
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
        
        configurationNavigation()
        bind()
        
        
    }
    
    private func bind() {
        
        let comfirmButton = PublishSubject<Void>()
        
        let input = DetailSettingViewModel.Input(viewDidLoad: Observable.just(()), seletecd: detailView.tableView.rx.itemSelected.asDriver(),
                                                 confirm: comfirmButton)
        
        let output = viewModel.transform(input: input)
        
        
        
        output.data.asDriver(onErrorJustReturn: [])
            .drive(detailView.tableView.rx.items) { cell, row, element in
                

                let cell = UITableViewCell(style: .value1, reuseIdentifier: "DetailSettingCell")
                
                cell.textLabel?.text = element.title
                cell.textLabel?.textColor = TamagotchiColor.basic
                       
                cell.detailTextLabel?.text = element.subtitle
                cell.detailTextLabel?.textColor = TamagotchiColor.basic
                
                cell.backgroundColor = TamagotchiColor.background
                cell.tintColor = TamagotchiColor.basic
                
                cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .none // 하이라이트 제거
                
                return cell
                
            }.disposed(by: disposeBag)
        
        
        output.changedName.asDriver(onErrorJustReturn: "").drive(with: self) { owner, value in
            let vc = ChangeNameViewController()
            
            owner.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
        
        
        
        
        //        output.data.asDriver(onErrorJustReturn: []).drive(detailView.tableView.rx.items(cellIdentifier: "DetailSettingCell", cellType: UITableViewCell.self)) { row, element, cell in
        //
        //            print(element.subtitle)
        //
        //            cell.textLabel?.text = element.title
        //            cell.textLabel?.textColor = TamagotchiColor.basic
        //
        //
        //
        //            cell.detailTextLabel?.text = element.subtitle
        //            cell.detailTextLabel?.textColor = TamagotchiColor.basic
        //
        //            cell.backgroundColor = TamagotchiColor.background
        //            cell.tintColor = TamagotchiColor.basic
        //
        //            cell.accessoryType = .disclosureIndicator
        //            cell.selectionStyle = .none // 하이라이트 제거
        //
        //        }.disposed(by: disposeBag)
        //
        //
        //        output.changedName.asDriver(onErrorJustReturn: "").drive(with: self) { owner, value in
        //            let vc = ChangeNameViewController()
        //
        //            owner.navigationController?.pushViewController(vc, animated: true)
        //
        //        }.disposed(by: disposeBag)
        //
        
        output.changedTamagotchi.asDriver(onErrorJustReturn: "").drive(with: self) { owner, value in
            
            let vc = ChangeTamagotchiViewController()
            
            owner.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
        
        
        output.resetData.asDriver(onErrorJustReturn: []).drive(with: self) { owner, value in
            
            let alert = UIAlertController(title: value[0], message: value[1], preferredStyle: .alert)
            let ok = UIAlertAction(title: "웅", style: .destructive) { _ in
                comfirmButton.onNext(())
                
                
                print("화면전환")
            }
            let cancle = UIAlertAction(title: "아냐!", style: .cancel)
            
            
            
            alert.addAction(ok)
            alert.addAction(cancle)
            
            owner.present(alert,animated: true)
            
            
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
    
    private func resetData() -> Observable<String> {
        return Observable.create { value in
            
            value.onNext("")
            
            return Disposables.create()
        }
    }
    
}
