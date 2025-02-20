//
//  ImageSet.swift
//  MyTamagochi
//
//  Created by youngkyun park on 2/20/25.
//

import Foundation
import UIKit


enum ImageSet {
    
    static let tamagotchiImageList: [[UIImage]] = [
        [._1_1, ._1_2, ._1_3, ._1_4, ._1_5, ._1_6, ._1_7, ._1_8, ._1_9],
        [._2_1, ._2_2, ._2_3, ._2_4, ._2_5, ._2_6, ._2_7, ._2_8, ._2_9],
        [._3_1, ._3_2, ._3_3, ._3_4, ._3_5, ._3_6, ._3_7, ._3_8, ._3_9]
    ]
    
    static var noImage = UIImage(resource: .no)
    
    
}
