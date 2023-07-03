//
//  GameManager.swift
//  Project 1_BullsEye
//
//  Created by Gulazor Gulmamadova on 23/06/2023.
//

import Foundation

class GameManager {
    
    // Угадываемое число
    var guessingNumber: Int
    
    // Текущий счет
    var score: Int
    
    // Текущий раунд
    var round: Int
    
    // Maximum number of rounds. We use let because this number will not change unlike others
    
    let maxRound = 10
    
    init () {
        self.guessingNumber = Int.random(in: 1...100) //(генерировать число от 1 до 100)
        self.score = 0
        self.round = 1
    }
    // Действие
    func nextRound () {
        round = round + 1
        guessingNumber = Int.random(in: 1...100)
        
    }
    func startNewGame () {
            guessingNumber = Int.random(in: 1...100)
            score = 0
            round = 1
        }
}
