//
//  Loading.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("completeLevel") var completeLevel = false
    @State private var loadingProggress: CGFloat = 0
    @State private var blueCubeScale: CGFloat = 1
    @State private var redCubeScale: CGFloat = 1
    @State private var generalOpacity: CGFloat = 1
    @State private var timer1: Timer? = nil
    @State private var timer2: Timer? = nil
    var body: some View {
        ZStack {
            Background()
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    VStack(spacing: height*0.1) {
                        ZStack {
                            Image("redCube")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.15)
                                .offset(x: width*0.07)
                                .scaleEffect(x: redCubeScale, y: redCubeScale)
                            Image("blueCube")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.15)
                                .offset(x: -width*0.07, y: -height*0.07)
                                .scaleEffect(x: blueCubeScale, y: blueCubeScale)
                        }
                        Text("LOADING...")
                            .font(Font.custom("drukwidecyr-bold", size: height*0.1))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 1)
                        ZStack {
                            Image("loadingLineBack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.7)
                            Image("loadingLineFront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.7)
                                .offset(x: -width*0.7*loadingProggress)
                                .mask(
                                    Image("loadingLineFront")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width*0.7)
                                )
                        }
                    }
                    .opacity(generalOpacity)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    VStack {
                        Text("LOADING...")
                            .font(Font.custom("drukwidecyr-bold", size: width*0.1))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1)
                            .shadow(color: .black, radius: 1)
                        ZStack {
                            Image("loadingLineBack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: height*0.7)
                            Image("loadingLineFront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: height*0.7)
                                .mask(
                                    Image("loadingLineFront")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: height*0.7)
                                )
                        }
                    }
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        
        .onChange(of: completeLevel) { _ in
            if completeLevel {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    coordinator.navigate(to: .mainMenu)
                }
            }
        }
        
        .onAppear {
           loadingAnimation()
        }
        
    }
    
    func opacityAnimation() {
        generalOpacity = 0
        withAnimation(Animation.easeInOut(duration: 1)) {
            generalOpacity = 1
        }
    }
    
    func loadingAnimation() {
        opacityAnimation()
        startTimer1()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
         startTimer2()
        }
        loadingProggress = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 3)) {
                loadingProggress = 0
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            coordinator.navigate(to: .mainMenu)
//        }
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
    Loading()
}
