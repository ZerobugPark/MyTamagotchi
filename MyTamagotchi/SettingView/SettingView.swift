//
//  SettingView.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit
import SnapKit


final class SettingView: BaseView {

    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
    override func configureHierarchy() {
        
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        
        collectionView.backgroundColor = TamagotchiColor.background
    }
    
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 10
        let inset: CGFloat = 8
        
        layout.minimumInteritemSpacing = spacing
        
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        layout.scrollDirection = .vertical
        
   
        return layout
    }
}
