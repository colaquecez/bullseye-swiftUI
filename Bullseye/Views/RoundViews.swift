//
//  RoundViews.swift
//  Bullseye
//
//  Created by Filipe Pereira Colaquecez on 30/07/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(systemName: systemName).font(.title).foregroundColor(Color("TextColor")).frame(width: 50, height: 50).overlay(Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2))
        }
        
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        
        Image(systemName: systemName).font(.title).foregroundColor(Color("ButtonFilledTextColor")).frame(width: 50, height: 50).background(Circle().fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text).font(.title2).bold().kerning(-0.2).foregroundColor(Color("TextColor")).frame(width: 68, height: 56).overlay(RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack() {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise", action: {print("click buton")})
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundRectTextView(text: "999")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
