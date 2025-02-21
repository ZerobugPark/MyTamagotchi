//
//  SettingViewController.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

import RxSwift
import RxCocoa

final class SettingViewController: UIViewController {

    
    private let settingView = SettingView()
    private let viewModel = SettingViewModel()
    

    let disposeBag = DisposeBag()
    
    

    override func loadView() {
        view = settingView
  
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView.collectionView.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: SettingCollectionViewCell.id)
        

        bind()
    }
    
    private func bind() {
        
        let input = SettingViewModel.Input()
        
        let output = viewModel.transform(input: input)
     

        output.tamagotchiList.bind(to: settingView.collectionView.rx.items(cellIdentifier: SettingCollectionViewCell.id, cellType: SettingCollectionViewCell.self)) { item , element, cell in
            
            cell.setup(info: element, index: item)
            
            
        }.disposed(by: disposeBag)
        
        settingView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        Observable.zip(settingView.collectionView.rx.itemSelected, settingView.collectionView.rx.modelSelected(Tamagotchi.self)).bind(with: self, onNext: { owner, value in
            
            let vc = PopupViewController()
            
            var status = false
            var image: UIImage
            
            switch value.0.item {
            case 0:
                image = ImageSet.tamagotchiImageList[value.0.item][value.1.imageIndex]
                status = false
            case 1:
                image = ImageSet.tamagotchiImageList[value.0.item][value.1.imageIndex]
                status = false
            case 2:
                image = ImageSet.tamagotchiImageList[value.0.item][value.1.imageIndex]
                status = false
            default:
                image = ImageSet.noImage
                status = true
            }
            
            
            let nameTitle = value.1.nameTitle
            let tamagotchi = TamagotchiInfo(nameTitle: nameTitle, image: image)
            
            vc.viewModel.tamagotchiInfo = (tamagotchi, status)
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            print("here")
        
            owner.present(vc, animated: true)
        
            
        }).disposed(by: disposeBag)
        
        
       
  
    }
    

}

// MARK: - UICollectionViewDelegateFlowLayOut
extension SettingViewController: UICollectionViewDelegateFlowLayout {
    
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



