//
//  Coordinator.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import Foundation
import SwiftUI

enum CoordinatorView: Equatable {
    case loading
    case mainMenu
    case game
//    case inventory
//    case howToPlay
//case settings
}

final class Coordinator: ObservableObject {
    @Published var path: [CoordinatorView] = []

    func resolve(pathItem: CoordinatorView) -> AnyView {
        var view = AnyView(Loading())
        switch pathItem {
        case .loading:
            view = AnyView(Loading())
        case .mainMenu:
            view = AnyView(Menu())
        case .game:
            view = AnyView(Game())
//        case .inventory:
//            view = AnyView(Inventory())
//        case .howToPlay:
//            view = AnyView(HowToPlay())
//        case .settings:
//            view = AnyView(Settings())
        }
        return view
    }
    
    func navigate(to pathItem: CoordinatorView) {
        path.append(pathItem)
    }
    
    func navigateBack() {
        _ = path.popLast()
    }
}

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        ZStack {
            coordinator.resolve(pathItem: coordinator.path.last ?? .loading)
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    ContentView()
}


