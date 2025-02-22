//
//  ChangNameViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class ChangeNameViewController: UIViewController {

    
    private let lineView = CustomView(color: TamagotchiColor.basic)
    private let nameTextField = CustomTextField()
    
    private let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
        
        configurationNavigation()
        view.backgroundColor = TamagotchiColor.background
        nameTextField.text = "테스트입니다"
        
        bind()
    }
    
    
    private func bind() {
     
        
        
        
        nameTextField.rx.controlEvent(.editingDidBegin).bind(with: self) { owner, _ in
            owner.nameTextField.text = ""
        }.disposed(by: disposeBag)
        
        
        
        
    }

  
    private func configurationNavigation() {
        
        let rightButton = UIBarButtonItem(title: "저장", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        
    }

}


extension ChangeNameViewController {
    
    func configuration() {
        
        view.addSubview(nameTextField)
        view.addSubview(lineView)
        
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        
        nameTextField.textAlignment = .left
    }
}
