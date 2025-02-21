//
//  PopupViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import UIKit

import RxSwift
import RxCocoa

final class PopupViewController: UIViewController {
    
    
    private let popupView = PopupView()
    
    var viewModel = PopupViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = popupView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view.backgroundColor = .black
        bind()
        
        popupView.confirmButton.isHidden = true
    }
    
    
    private func bind() {
        
        let input = PopupViewModel.Input()
        let output = viewModel.transform(input: input)
        
        
        output.info.bind(with: self) { owner, value in
        
            //popupView.tamagotchiImage.image = 
           // value.0.imageIndex
            
            
        }.disposed(by: disposeBag)
        
        popupView.cancelButton.rx.tap.bind(with: self) { owner, _ in
            
            owner.dismiss(animated: true)
            
        }.disposed(by: disposeBag)
    }
    

    

}





