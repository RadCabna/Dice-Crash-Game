//
//  Background.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import SwiftUI

struct Background: View {
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let isLandscape = width > height
            if isLandscape {
                ZStack {
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            } else {
                Image("background")
                    .resizable()
                    .frame(width: height*1.2, height: width)
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
            }
        }
    }
}

#Preview {
    Background()
}
