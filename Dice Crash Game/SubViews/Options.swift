//
//  Options.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 12.02.2025.
//

import SwiftUI

struct Options: View {
    @AppStorage("music") var music = true
    @AppStorage("sound") var sound = true
    @AppStorage("vibration") var vibration = true
    @Binding var optionsPresented: Bool
    var body: some View {
        ZStack {
            Background()
            Image("backButton")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.06)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    optionsPresented.toggle()
                }
            VStack {
                Image("settingsText")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                Spacer()
                    .frame(height: screenHeight*0.1)
                HStack {
                    Text("SOUNDS")
                        .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.05))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                    Image(sound ? "soundOn" : "soundOff")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.08)
                }
                .onTapGesture {
                    withAnimation() {
                        sound.toggle()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, screenWidth*0.3)
                HStack {
                    Text("MUSIC")
                        .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.05))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                    Image(music ? "soundOn" : "soundOff")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.08)
                }
                .onTapGesture {
                    withAnimation() {
                        music.toggle()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, screenWidth*0.3)
                HStack {
                    Text("VIDRATION")
                        .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.05))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                    Image(vibration ? "on" : "off")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.08)
                }
                .onTapGesture {
                    withAnimation() {
                        vibration.toggle()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, screenWidth*0.3)
            }
        }
    }
}

#Preview {
    Options(optionsPresented: .constant(true))
}
