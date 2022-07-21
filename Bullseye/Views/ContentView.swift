//
//  ContentView.swift
//  Bullseye
//
//  Created by Filipe Pereira Colaquecez on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var slidePoint = 0.0
    
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack {
                Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                Text(String(self.game.target))
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .kerning(-1.0)
                    .padding([.top], 9)
                    .foregroundColor(Color("TextColor"))
                HStack {
                    Text("1")
                        .bold()
                        .font(.headline)
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $slidePoint, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .font(.headline)
                        .foregroundColor(Color("TextColor"))
                }
                Button(action: {
                    alertIsVisible = true
                }) {
                    Text("Hit me".uppercased()).bold().font(.title3)
                }.alert("Hello There", isPresented: $alertIsVisible) {
                    Button("Awesome!") {}
                } message: {
                    let roundedValue = Int(slidePoint.rounded())
                    
                    Text("You scored \(game.points(sliderValue: roundedValue)) ")
                }.padding(20).background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                ).foregroundColor(.white).cornerRadius(21)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 Pro")
            
        }
        ContentView().previewLayout(.fixed(width: 568, height: 268))
    }
}
