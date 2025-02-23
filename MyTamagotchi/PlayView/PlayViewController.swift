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
    
    private let viewModel = PlayViewModel()
    
    let disposeBag = DisposeBag()
    
   
    let rightButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
    
    override func loadView() {
        view = playView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        configurationNavigation()
        
        view.rx.tapGesture().bind(with: self) { owner, _ in
            owner.view.endEditing(true)
        }.disposed(by: disposeBag)
        
        
    }
    
    
    
    
    
    private func bind() {
        
        
        let input = PlayViewModel.Input(rice: playView.riceButton.rx.tap.withLatestFrom(playView.riceTextField.rx.text.orEmpty), water: playView.waterButton.rx.tap.withLatestFrom(playView.waterTextField.rx.text.orEmpty), profileButtonTapped: rightButton.rx.tap.asDriver())

        let output = viewModel.transform(input: input)
        
            
        output.myTamagotchi.asDriver().drive(with: self) { owner, value in
            
            owner.navigationItem.title = value.0 + "님의 다마고치"
            owner.playView.levelLabel.text = value.1
            owner.playView.riceLabel.text = value.2
            owner.playView.waterLabel.text = value.3
            owner.playView.descriptionLabel.text = value.4
            owner.playView.tamagotchiImage.image = ImageSet.tamagotchiImageList[value.5.0][value.5.1]
            
            
        }.disposed(by: disposeBag)
        
        output.errorMessage.asDriver(onErrorJustReturn: "").drive(with: self) { owner, msg in
            
            let alert = UIAlertController(title: "안내", message: msg, preferredStyle: .alert)
    
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
            owner.present(alert,animated: true)
            
        }.disposed(by: disposeBag)
    
        
        output.riceTextFieldClear.asDriver(onErrorJustReturn: ())
            .drive(with: self) { owner, _ in
                owner.playView.riceTextField.text = ""
                owner.view.endEditing(true)
            }.disposed(by: disposeBag)
        
        output.waterTextFieldClear.asDriver(onErrorJustReturn: ())
            .drive(with: self) { owner, _ in
                owner.playView.waterTextField.text = ""
                owner.view.endEditing(true)
            }.disposed(by: disposeBag)
        
        output.profileButtonTapped.asDriver(onErrorJustReturn: "").drive(with: self) { owner, name in
            
            let vc = DetailSettingViewController()
         
            
            vc.viewModel.tamagotchiName = name
            owner.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
        
        
    }
    
    private func configurationNavigation() {
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = rightButton
    }

}
