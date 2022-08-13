//
//  Game.swift
//  Bullseye
//
//  Created by Filipe Pereira Colaquecez on 17/07/22.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var reward = 0;
        
        if(difference == 0) {
            reward += 100
        }
        
        if(difference <= 2 && difference > 0) {
            reward += 50
        }
        
        return 100 - difference + reward
    }
    
    mutating func startNewRound(point: Int) -> Void {
        score += point
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() -> Void {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}


