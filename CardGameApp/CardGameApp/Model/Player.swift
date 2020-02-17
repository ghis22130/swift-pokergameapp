//
//  Player.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Player: Playable {
    private var cards = [Card]()
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    func forEachCard(handler: (Card) -> () ) {
        cards.forEach(handler)
    }
}
