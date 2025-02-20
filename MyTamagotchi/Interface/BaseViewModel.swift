//
//  BaseViewModel.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import Foundation


protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
