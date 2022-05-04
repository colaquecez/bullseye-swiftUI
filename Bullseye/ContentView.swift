//
//  ContentView.swift
//  Bullseye
//
//  Created by Filipe Pereira Colaquecez on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89")
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1.0)
                .padding([.top], 9)
            HStack {
                Text("1")
                    .bold()
                    .font(.headline)
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .bold()
                    .font(.headline)
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                 Text("Hit me")
            }.alert("Hello There", isPresented: $alertIsVisible) {
                Button("Awesome!") {}
            } message: {
                Text("This is my first pop-up")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro")
                
        }
        ContentView().previewLayout(.fixed(width: 568, height: 268))
    }
}
