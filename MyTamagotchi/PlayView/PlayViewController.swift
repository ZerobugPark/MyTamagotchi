//
//  PlayViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture


final class PlayViewController: UIViewController {

    
    private let playView = PlayView()
    
    
    let disposeBag = DisposeBag()
    
   
    
    override func loadView() {
        view = playView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        configurationNavigation()
        
        print(UserDefaultManager.character)
        print(UserDefaultManager.isSave)
    }
    
    
    
    
    
    private func bind() {
        view.rx.tapGesture().bind(with: self) { owner, _ in
            owner.view.endEditing(true)
        }.disposed(by: disposeBag)
        
        
        
    }
    
    private func configurationNavigation() {
   
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        navigationItem.title = "test"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = rightButton
        
        rightButton.rx.tap.bind(with: self) { owner, _ in
            
            let vc = DetailSettingViewController()
            
            
            owner.navigationController?.pushViewController(vc, animated: true)
            
            
        }.disposed(by: disposeBag)
    }

}
