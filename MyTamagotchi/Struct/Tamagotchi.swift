//
//  TamagotchiInfo.swift
//  MyTamagotchi
//
//  Created by youngkyun park on 2/21/25.
//

import Foundation
import UIKit


struct Tamagotchi {
    let imageIndex: Int
    let nameTitle: String
    
}


struct TamagotchiInfo {
    let nameTitle: String
    let image: UIImage
    let description: String
    let character: Int
    
}


enum TamagotchiMessageList {
    
    static let description: [String] = [
        """
        "따끔따끔 다마고치"는 다소 독특한 성격을 가진 선인장 같은 다마고치입니다. 
        이 친구는 가끔씩 따끔하게 충전이 필요하지만, 
        그만큼 귀여운 모습과 재미있는 행동으로 사랑을 받아요. 
        손길이 필요할 때마다 다가가면, 마음을 열고 더 가까워질 수 있답니다!
        """,
        """
        "방실방실 다마고치"는 항상 웃음이 넘치는 즐거운 성격을 가진 다마고치입니다. 
        이 친구는 언제나 활짝 웃으며 주위를 밝게 만드는 존재로, 그 에너지를 받아들이면 기분이 좋아져요. 
        조금만 돌봐주면, 귀엽고 사랑스러운 미소를 보답해 줄 거예요!
        """,
        """
        "반짝반짝 다마고치"는 언제나 반짝이는 눈빛과 환한 미소로 주변을 밝혀주는 다마고치입니다. 
        이 친구는 항상 반짝이는 것들을 좋아해서, 작은 변화에도 기뻐하고 신나하는 모습을 보여줘요. 
        그 빛나는 매력을 통해, 당신에게도 따뜻한 에너지를 선사할 거예요!
        """
    ]
    
    
    static let messageList = [
        "배고파! 맛있는 거 먹고 싶어~ 🍙",
        "졸려… 조금만 자고 올게요. 😴",
        "심심해! 놀아줄 거지? 🎾",
        "목말라! 시원한 물 한 잔 주세요~ 💧",
        "기분 최고! 오늘도 행복한 하루야! 😆",
        "몸이 더러워졌어… 씻겨줄 수 있어? 🚿",
        "방이 엉망이야! 청소가 필요해~ 🧹",
        "운동하고 싶어! 같이 뛰어놀자! 🏃‍♂️",
        "외로워… 조금만 더 같이 있어줘! 💕",
        "잘 돌봐줘서 고마워! 최고야! 🎉"
        
    ]
    
    
}
