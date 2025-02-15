//
//  Game.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import SwiftUI

struct Game: View {
    @State private var ballancePersentage: CGFloat = 0
    @State private var rectanglesOnGameField = Arrays.rectanglesOnGameField
    @State private var linesOnGameField = Arrays.blueLinesOnGameField
    @State private var enemyLinesOnGameField = Arrays.redLinesOnGameField
    @State private var yourTurn = true
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
                    
                }
            ZStack {
                if yourTurn {
                    HStack {
                        Text("YOU TURN")
                            .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.03))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        Spacer()
                        Text("YOU TURN")
                            .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.03))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                    }
                }
                Image("gameField")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.338)
                ForEach(0..<linesOnGameField.count, id: \.self) { row in
                    ForEach(0..<linesOnGameField[row].count, id: \.self) { col in
                        if linesOnGameField[row][col].lineActive {
                            Image(linesOnGameField[row][col].itemName)
                                .frame(maxWidth: screenWidth*0.3, maxHeight: screenHeight*0.04)
                                .scaleEffect(x: 0.45, y: 0.45)
                                .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                                .shadow(color: linesOnGameField[row][col].itemName.hasPrefix("red") ? .red : .blue, radius: 5)
                                .shadow(color: linesOnGameField[row][col].itemName.hasPrefix("red") ? .red : .blue, radius: 5)
                                .offset(
                                    x: linesOnGameField[row][col].positionX * screenWidth/932,
                                    y: linesOnGameField[row][col].positionY * screenWidth/932
                                )
                        }
                    }
                }
                ForEach(0..<enemyLinesOnGameField.count, id: \.self) { row in
                    ForEach(0..<enemyLinesOnGameField[row].count, id: \.self) { col in
                        if enemyLinesOnGameField[row][col].lineActive {
                            Image(enemyLinesOnGameField[row][col].itemName)
                                .frame(maxWidth: screenWidth*0.3, maxHeight: screenHeight*0.04)
                                .scaleEffect(x: 0.45, y: 0.45)
                                .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                                .shadow(color: enemyLinesOnGameField[row][col].itemName.hasPrefix("red") ? .red : .blue, radius: 5)
                                .shadow(color: enemyLinesOnGameField[row][col].itemName.hasPrefix("red") ? .red : .blue, radius: 5)
                                .offset(
                                    x: enemyLinesOnGameField[row][col].positionX * screenWidth/932,
                                    y: enemyLinesOnGameField[row][col].positionY * screenWidth/932
                                )
                        }
                    }
                }
                ForEach(0..<rectanglesOnGameField.count, id: \.self) { row in
                    ForEach(0..<rectanglesOnGameField[row].count, id: \.self) { col in
                        ZStack {
                            Image("blackCube")
                                .resizable()
                                .scaledToFit()
                                .frame(height: screenWidth*0.027)
                                .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                            if !rectanglesOnGameField[row][col].strokeActive {
                                Image("cubeGreenShine")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.027)
                                    .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
                            }
                        }
                        .onTapGesture {
                            
                        }
                    }
                }
                
               
                ZStack {
                    Image("ballanceBackRectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.06)
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: screenWidth*0.01)
                            .frame(width: screenWidth*0.51, height: screenWidth*0.01)
                            .foregroundColor(.green)
                            .offset(x: -(screenWidth*0.25 - screenWidth*0.25*ballancePersentage))
                        RoundedRectangle(cornerRadius: screenWidth*0.01)
                            .frame(width: screenWidth*0.51, height: screenWidth*0.01)
                            .foregroundColor(.red)
                            .offset(x: screenWidth*0.25 + screenWidth*0.25*ballancePersentage)
                        RoundedRectangle(cornerRadius: screenWidth*0.01)
                            .frame(width: screenWidth*0.5, height: screenWidth*0.004)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
                    .mask(
                        RoundedRectangle(cornerRadius: screenWidth*0.01)
                            .frame(width: screenWidth*0.51, height: screenWidth*0.01)
                    )
                    Image("ballanceRectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.05)
                        .offset(x: screenWidth*0.25*ballancePersentage)
                }
                .offset(y: screenHeight*0.44)
            }
        }
    }
}

#Preview {
    Game()
}
