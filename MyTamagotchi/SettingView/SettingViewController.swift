//
//  SettingViewController.swift
//  MyTamagochi
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
            print("here")
            print(element)
            //cell.setup(text: element)
            
        }.disposed(by: disposeBag)
        
        settingView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
  
    }
    

}

// MARK: - UICollectionViewDelegateFlowLayOut
extension SettingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("here22")
        let deviceWidth = view.frame.width
        
        
        let spacing: CGFloat = 10.0
        let inset: CGFloat = 8
        let imageCount: CGFloat = 3
        
        let objectWidth = (deviceWidth - ((spacing * (imageCount - 1)) + (inset * 2))) / imageCount
        let objectHeight = objectWidth
        
        
        return CGSize(width: objectWidth, height: objectHeight)
    }
  
}



