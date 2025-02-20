//
//  BaseView.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
       
        self.backgroundColor = TamagotchiColor.background
    }
    
    func configureHierarchy() { }
    
    func configureLayout() { }
    
    func configureView() { }
  
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
