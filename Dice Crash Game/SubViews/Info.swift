//
//  Info.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 12.02.2025.
//

import SwiftUI

struct Info: View {
    let rulesText = Arrays.rulesText
    @State private var blueCubeScale: CGFloat = 1
    @State private var redCubeScale: CGFloat = 1
    @State private var timer1: Timer? = nil
    @State private var timer2: Timer? = nil
    @Binding var infoPresented: Bool
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
                    infoPresented.toggle()
                }
            VStack {
                Image("rulesText")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                Spacer()
                Text(rulesText)
                    .font(Font.custom("drukwidecyr-bold", size: screenWidth*0.024))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1)
                    .shadow(color: .black, radius: 1)
                    .padding(.trailing, screenWidth*0.25)
                Spacer()
            }
            .padding(.vertical)
            ZStack {
                Image("redCube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.15)
                    .offset(x: -screenWidth*0.03, y: screenHeight*0.17)
                    .scaleEffect(x: redCubeScale, y: redCubeScale)
                Image("blueCube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.15)
                    .offset(x: -screenWidth*0.07, y: -screenHeight*0.17)
                    .scaleEffect(x: blueCubeScale, y: blueCubeScale)
            }
            .offset(x: screenWidth*0.38)
        }
        
        .onAppear {
            startTimer1()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                startTimer2()
            }
        }
        
    }
    
    func startTimer1() {
        timer1 = Timer.scheduledTimer(withTimeInterval: TimeInterval(3), repeats: true) { _ in
            withAnimation(Animation.easeOut(duration: 0.6)) {
                redCubeScale = 1.2
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(Animation.easeOut(duration: 0.6)) {
                    redCubeScale = 1
                }
            }
        }
    }
    
    func startTimer2() {
        timer2 = Timer.scheduledTimer(withTimeInterval: TimeInterval(3), repeats: true) { _ in
            withAnimation(Animation.easeOut(duration: 0.6)) {
                blueCubeScale = 1.2
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(Animation.easeOut(duration: 0.6)) {
                    blueCubeScale = 1
                }
            }
        }
    }
    
}

#Preview {
    Info(infoPresented: .constant(true))
}
