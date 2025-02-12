//
//  SizeExtention.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 12.02.2025.
//

import Foundation
import SwiftUI

extension View {
    
    var screenHeight : CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var deviceHasSafeArea: Bool {
        let window = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 50
        return window > 20
    }
}
