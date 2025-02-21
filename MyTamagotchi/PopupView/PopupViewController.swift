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
        bind()

    }
    
    
    private func bind() {
        
        let input = PopupViewModel.Input()
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
            
            //여기서 현재 선택된 데이터 저장하는 코드 추가 필요
            
            window.rootViewController = UINavigationController(rootViewController: PlayViewController())
            window.makeKeyAndVisible()
            
        }.disposed(by: disposeBag)
            
            
            
     
        popupView.cancelButton.rx.tap.bind(with: self) { owner, _ in
            
            owner.dismiss(animated: true)
            
        }.disposed(by: disposeBag)
    }
    
    
    
    
}





