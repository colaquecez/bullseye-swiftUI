//
//  ContentView.swift
//  Bullseye
//
//  Created by Filipe Pereira Colaquecez on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue = 0.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding([.bottom], alertIsVisible ? 0 : 100)
                
                if alertIsVisible {
                    PointsViews(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale) 
                }
            }
            
            !alertIsVisible ? SliderView(sliderValue: $sliderValue).transition(.scale) : nil
        }
    }
    
    struct SliderView: View {
        
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderLabelText(text: "100")
            }.padding()
        }
    }
    
    struct InstructionsView: View {
        
        @Binding var game: Game
        
        var body: some View {
            VStack {
                InstructionText(text: "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .padding([.trailing, .leading], 30.0)
                    .padding([.bottom], 9)
                BigNumberText(text: String(game.target))
            }
        }
    }
    
    struct HitMeButton: View {
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View {
            
            Button(action: {
                withAnimation{
                    alertIsVisible = true
                }
            }) {
                Text("Hit me".uppercased()).bold().font(.title3)
            }.padding(20).background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            ).foregroundColor(.white).cornerRadius(Constants.General.roundRectCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro")
            
        }
        ContentView().previewLayout(.fixed(width: 568, height: 368))
    }
}
