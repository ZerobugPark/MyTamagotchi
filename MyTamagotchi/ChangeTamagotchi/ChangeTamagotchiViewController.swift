//
//  ChangeTamagotchiViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/22/25.
//

import UIKit

import RxSwift
import RxCocoa


class ChangeTamagotchiViewController: UIViewController {

    private let settingView = SettingView()
    private let viewModel = ChangeTamagotchiViewModel()
    

    let disposeBag = DisposeBag()
    
    

    override func loadView() {
        view = settingView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingView.collectionView.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: SettingCollectionViewCell.id)
        navigationItem.title = "다마고치 선택하기"
        bind()
    }
    
    
    private func bind() {
        
        let input = ChangeTamagotchiViewModel.Input(itemSelected: settingView.collectionView.rx.itemSelected)
                                              
        let output = viewModel.transform(input: input)
     

        output.tamagotchiList.asDriver().drive( settingView.collectionView.rx.items(cellIdentifier: SettingCollectionViewCell.id, cellType: SettingCollectionViewCell.self)) { item , element, cell in
            
            cell.setup(info: element, index: item)
            
            
        }.disposed(by: disposeBag)
        
        settingView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
 
        output.tamagotchiInfo.bind(with: self) { owner, value in
            let vc = ChangePopupViewController()
            vc.viewModel.tamagotchiInfo = value
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            owner.present(vc, animated: true)
        }.disposed(by: disposeBag)
        
    }

}


// MARK: - UICollectionViewDelegateFlowLayOut
extension ChangeTamagotchiViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let deviceWidth = view.frame.width
        
        let spacing: CGFloat = 10.0
        let inset: CGFloat = 8
        let imageCount: CGFloat = 3
        
        let objectWidth = (deviceWidth - ((spacing * (imageCount - 1)) + (inset * 2))) / imageCount
        let bottomPaddingMargin = 6.0
        let objectHeight = objectWidth + bottomPaddingMargin
        
        
        return CGSize(width: objectWidth, height: objectHeight)
    }
  
}
