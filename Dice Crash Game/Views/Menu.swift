//
//  Menu.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import SwiftUI

struct Menu: View {
    @AppStorage("coinCount") var coinCount = 0
    @State private var selectedGameMode = 1
    @State private var generalOpacity: CGFloat = 1
    @State private var infoPresented = false
    @State private var optionsPresented = false
    var body: some View {
        ZStack {
            Background()
            Image("cristallPlate")
                .resizable()
                .scaledToFit()
                .frame(height: screenHeight*0.18)
                .overlay(
                    HStack {
                        Image("cristall")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenHeight*0.1)
                        Spacer()
                        Text("\(coinCount)")
                            .font(Font.custom("drukwidecyr-bold", size: screenHeight*0.05))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Spacer()
                    }
                        .padding(.horizontal)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
            VStack(spacing: screenHeight*0.05) {
                Image("menuFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight*0.45)
                    .overlay(
                        VStack {
                                HStack {
                                    Image(selectedGameMode == 1 ? "pointOn" : "pointOff")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenHeight*0.05)
                                    Text("2PLAYERS")
                                        .font(Font.custom("drukwidecyr-bold", size: screenHeight*0.045))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                        .opacity(selectedGameMode == 1 ? 1 : 0.5)
                                }
                                .onTapGesture {
                                    selectedGameMode = 1
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                HStack {
                                    Image(selectedGameMode == 2 ? "pointOn" : "pointOff")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenHeight*0.05)
                                    Text("AI")
                                        .font(Font.custom("drukwidecyr-bold", size: screenHeight*0.045))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                        .opacity(selectedGameMode == 2 ? 1 : 0.5)
                                }
                                .onTapGesture {
                                    selectedGameMode = 2
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                            Spacer()
                                .frame(height: screenHeight*0.1)
                            Image("playButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenHeight*0.14)
                        }
                    )
                HStack {
                    Image("infoButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenHeight*0.14)
                        .onTapGesture {
                            infoPresented.toggle()
                        }
                    Image("optionsButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenHeight*0.14)
                        .onTapGesture {
                            optionsPresented.toggle()
                        }
                }
            }
            .offset(y: screenHeight*0.1)
            
            if infoPresented {
               Info(infoPresented: $infoPresented)
            }
            
            if optionsPresented {
                Options(optionsPresented: $optionsPresented)
            }
        }
    }
}

#Preview {
    Menu()
}
