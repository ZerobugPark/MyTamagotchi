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
        
        
    }
    
    
    private func bind() {
        
        let input = PopupViewModel.Input()
        let output = viewModel.transform(input: input)
        
        
        //        output.info.bind(with: self) { owner, value in
        //
        //
        //        }.disposed(by: disposeBag)
        
        output.info
            .map {(tamagotchi: $0, status: $1) }
            .subscribe(with: self) { owner, value in
                
                owner.popupView.tamagotchiImage.image = value.tamagotchi.image
                owner.popupView.title.text = value.tamagotchi.nameTitle
                
                owner.popupView.confirmButton.isHidden = value.status
            
                
                
            } onError: { owner, error in
                print("onError")
            } onCompleted: { owner in
                print("onCompleted")
            } onDisposed: { owner in
                print("onDisposed")
            }.disposed(by: disposeBag)
        
        
        popupView.cancelButton.rx.tap.bind(with: self) { owner, _ in
            
            owner.dismiss(animated: true)
            
        }.disposed(by: disposeBag)
    }
    
    
    
    
}





