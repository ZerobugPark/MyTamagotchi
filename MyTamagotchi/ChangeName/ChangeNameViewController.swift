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
    
    var viewModel = ChangeNameViewModel()
    
    private let rightButton = UIBarButtonItem(title: "저장", style: .plain, target: nil, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
        
        configurationNavigation()
        view.backgroundColor = TamagotchiColor.background
        
        bind()
    }
    
    
    private func bind() {
     
        let input = ChangeNameViewModel.Input(saveButtonTapped: rightButton.rx.tap.withLatestFrom(nameTextField.rx.text.orEmpty).distinctUntilChanged())
        
        let output = viewModel.transform(input: input)
        
        
        output.tamagotchiName
            .bind(to: nameTextField.rx.text)
            .disposed(by: disposeBag)
        
        output.saveButtonTapped.asDriver(onErrorJustReturn: ()).drive(with: self) { owner, _ in
            
            owner.navigationController?.popViewController(animated: true)
            
        }.disposed(by: disposeBag)
            
   
        
        
    }

  
    private func configurationNavigation() {
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
