//
//  ChangePopupViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import RxSwift
import RxCocoa

final class ChangePopupViewController: UIViewController {

    private let popupView = PopupView()
    
    var viewModel = ChangePopupViewModel()
    
    private let disposeBag = DisposeBag()
    
    private let changeTamagotchi = PublishRelay<Void>()
    
    
    override func loadView() {
        view = popupView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
        popupView.confirmButton.setTitle("변경하기", for: .normal)
       
   
        
    }
    
    private func bind() {
        
        let input = ChangePopupViewModel.Input(changeTamagotchi: changeTamagotchi)
        
        let output = viewModel.transform(input: input)
        
        output.info
            .map {(tamagotchi: $0, status: $1) }
            .bind(with: self) { owner, value in
                owner.popupView.tamagotchiImage.image = value.tamagotchi.image
                owner.popupView.title.text = value.tamagotchi.nameTitle
                owner.popupView.descriptionLabel.text = value.tamagotchi.description
                owner.popupView.confirmButton.isHidden = value.status
            }.disposed(by: disposeBag)
            
        
        popupView.confirmButton.rx.tap.bind(with: self) { owner, _ in
            
       
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
            
            owner.changeTamagotchi.accept(())
            
            window.rootViewController = UINavigationController(rootViewController: PlayViewController())
            window.makeKeyAndVisible()
            
        }.disposed(by: disposeBag)
            

            
     
        popupView.cancelButton.rx.tap.bind(with: self) { owner, _ in
            
            owner.dismiss(animated: true)
            
        }.disposed(by: disposeBag)
    }

    
    
}
