//
//  GamePlayTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class GamePlayTests: XCTestCase {
    
    var cardDeck: CardDeck!
    
    override func setUp() {
        cardDeck = CardDeck()
    }
    
    func testPlayersEntrance() {
        let numberOfPlayers = Players.Number.four
        let expectedPlayers = (0..<4).map { _ in Participant() }
        XCTAssertEqual(numberOfPlayers.invokePerPlayerCount { Participant() }, expectedPlayers)
    }
    
    func testEachPlayerTakesACard() {
        let players = Players(with: .three)
        players.repeatForEachPlayer { $0.take(card: cardDeck.removeOne()) }
        let cards = players.repeatForEachPlayer { $0.repeatForEachCard { $0 } }
        
        XCTAssertEqual(cards.count, 3)
        XCTAssertEqual(cards.map { $0.count }, [1, 1, 1])
    }
    
    func testSevenCardStudGamePlayDealing() {
        let gamePlay = GamePlay(rule: .sevenCardStud, numberOfPlayers: .two, cardDeck: cardDeck)
        gamePlay.deal()
        
        var participantCount = 0
        gamePlay.repeatForEachParticipant { participant in
            participantCount += 1
            var cardCount = 0
            participant.repeatForEachCard { _ in
                cardCount += 1
            }
            XCTAssertEqual(cardCount, 7)
        }
        XCTAssertEqual(participantCount, 3)
    }

    func testFiveCardStudGamePlayDealing() {
        let gamePlay = GamePlay(rule: .fiveCardStud, numberOfPlayers: .three, cardDeck: cardDeck)
        gamePlay.deal()
        
        var participantCount = 0
        gamePlay.repeatForEachParticipant { participant in
            participantCount += 1
            var cardCount = 0
            participant.repeatForEachCard { _ in
                cardCount += 1
            }
            XCTAssertEqual(cardCount, 5)
        }
        XCTAssertEqual(participantCount, 4)
    }
}
