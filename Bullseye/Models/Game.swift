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
        100 - abs(target - sliderValue)
    }
}


