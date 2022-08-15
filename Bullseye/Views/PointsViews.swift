//
//  PointsViews.swift
//  Bullseye
//
//  Created by Filipe Colaquecez on 8/13/22.
//

import SwiftUI

struct PointsViews: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing:10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points \n 🎉🎉🎉")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(point: points)
            }) {
                ButtonText(text: "Start new Round")
            }
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y:5)
        .transition(.scale)
    }
}


struct PointsViews_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game(target: 100, score: 200, round: 3))
    
    static var previews: some View {
        
        PointsViews(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
        PointsViews(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible).preferredColorScheme(.dark)
    }
}
