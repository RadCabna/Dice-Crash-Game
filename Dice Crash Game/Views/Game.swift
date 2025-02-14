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
//                HStack {
//                    Image("backButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: screenWidth*0.06)
//                        .onTapGesture {
//                            ballancePersentage -= 0.1
//                        }
//                    Image("backButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: screenWidth*0.06)
//                        .scaleEffect(x: -1)
//                        .onTapGesture {
//                            ballancePersentage += 0.1
//                        }
//                }
                Image("gameField")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.33)
                ForEach(0..<rectanglesOnGameField.count, id: \.self) { row in
                    ForEach(0..<rectanglesOnGameField[row].count, id: \.self) { col in
                        ZStack {
                            RoundedRectangle(cornerRadius: 1.0)
                                .frame(width: screenWidth*0.025, height: screenWidth*0.025)
                                .foregroundColor(.black)
                                .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
//                            if rectanglesOnGameField[row][col].strokeActive {
//                                RoundedRectangle(cornerRadius: 1.0)
////                                    .stroke(lineWidth: rectangleStroWidth)
//                                    .frame(width: screenWidth*0.025, height: screenWidth*0.025)
//                                    .foregroundColor(rectanglesOnGameField[row][col].strokeColor)
//                                    .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
//                            }
//                            if rectanglesOnGameField[row][col].haveThunder {
//                                Image(rectanglesOnGameField[row][col].yourThunder ? yourThunder : enemyThunder)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: screenWidth*0.015)
//                                    .offset(x: rectanglesOnGameField[row][col].positionX * screenWidth/932, y: rectanglesOnGameField[row][col].positionY * screenWidth/932)
//                            }
                        }
                        .onTapGesture {
//                            if pvp {
//                                makeStep(row: row, col: col)
//                            } else {
//                                makeStepWhenGameWithBot(row: row, col: col)
//                            }
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
//                            .opacity(0.4)
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
