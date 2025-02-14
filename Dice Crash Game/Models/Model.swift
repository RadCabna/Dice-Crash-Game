//
//  Model.swift
//  Dice Crash Game
//
//  Created by Алкександр Степанов on 12.02.2025.
//

import Foundation
import SwiftUI

struct Thunder: Equatable {
    var itemName: String = ""
    var positionX: CGFloat
    var positionY: CGFloat
    var lineCollect = false
    var haveThunder = false
    var yourThunder = true
    var strokeActive = false
    var strokeColor = Color.white
    var isSelect = false
}

struct Lines: Equatable {
    var itemName: String
    var positionX: CGFloat
    var positionY: CGFloat
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    var opacity: CGFloat = 1
    var lineActive = false
}

struct ShopItem {
    var itemImage: String
    var itemName: String
}

class Arrays {
    
    static var rulesText = "Place all your pieces on the board and move them to form a row of three pieces . When you create a mill, you can remove one of your opponent's pieces. If a mill is broken, you can form it again to continue removing pieces. Pieces in a mill cannot be removed if the opponent has other available pieces. The goal is to leave your opponent with only two pieces or no possible moves."
    
    static var guidePlateArray = [
    "guideImage1",
    "guideImage2",
    "guideImage3",
    "guideImage4",
    "guideImage5",
    "guideImage6"
    ]
    
    static var shopItemsArray: [ShopItem] = [
    ShopItem(itemImage: "blueThunder", itemName: "BLUE THUNDER"),
    ShopItem(itemImage: "yellowThunder", itemName: "YELLOW THUNDER"),
    ShopItem(itemImage: "redThunder", itemName: "RED \nTHUNDER"),
    ShopItem(itemImage: "violetThunder", itemName: "VIOLET THUNDER"),
    ShopItem(itemImage: "lightBlueThunder", itemName: "LIGHT BLUE \nTHUNDER")
    ]
    
    static var loadingArray = [
        "loadingThunder1",
        "loadingThunder2",
        "loadingThunder3",
        "loadingThunder4",
        "loadingThunder5"
        ]
    
    static var rectanglesOnGameField: [[Thunder]] = [
        [Thunder(positionX: -138, positionY: -138), Thunder(positionX: 0, positionY: -138), Thunder(positionX: 138, positionY: -138)],
        [Thunder(positionX: -100, positionY: -100), Thunder(positionX: 0, positionY: -100), Thunder(positionX: 100, positionY: -100)],
        [Thunder(positionX: -63, positionY: -63), Thunder(positionX: 0, positionY: -63), Thunder(positionX: 63, positionY: -63)],
        
        [Thunder(positionX: -138, positionY: -0), Thunder(positionX: -100, positionY: -0), Thunder(positionX: -63, positionY: -0)],
        [Thunder(positionX: 63, positionY: -0), Thunder(positionX: 100, positionY: -0), Thunder(positionX: 138, positionY: -0)],
        
        [Thunder(positionX: -63, positionY: 63), Thunder(positionX: 0, positionY: 63), Thunder(positionX: 63, positionY: 63)],
        [Thunder(positionX: -100, positionY: 100), Thunder(positionX: 0, positionY: 100), Thunder(positionX: 100, positionY: 100)],
        [Thunder(positionX: -138, positionY: 138), Thunder(positionX: 0, positionY: 138), Thunder(positionX: 138, positionY: 138)]
    ]
    
    static var blueLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "blueVertical1", positionX: -138, positionY: 0), Lines(itemName: "blueVertical2", positionX: -100, positionY: 0), Lines(itemName: "blueVertical3", positionX: -63, positionY: 0),],
    [Lines(itemName: "blueVertical1", positionX: 138, positionY: 0), Lines(itemName: "blueVertical2", positionX:100, positionY: 0), Lines(itemName: "blueVertical3", positionX: 63, positionY: 0)],
    [Lines(itemName: "blueVertical4", positionX: 0, positionY: -100), Lines(itemName: "blueVertical4", positionX: 0, positionY: 100)],
    [Lines(itemName: "blueHorizontal1", positionX: 0, positionY: -138), Lines(itemName: "blueHorizontal2", positionX: 0, positionY: -100), Lines(itemName: "blueHorizontal3", positionX: 0, positionY: -63)],
    [Lines(itemName: "blueHorizontal1", positionX: 0, positionY: 138), Lines(itemName: "blueHorizontal2", positionX: 0, positionY: 100), Lines(itemName: "blueHorizontal3", positionX: 0, positionY: 63)],
    [Lines(itemName: "blueHorizontal4", positionX: -100, positionY: 0), Lines(itemName: "blueHorizontal4", positionX: 100, positionY: 0)]
    ]
    
    static var redLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "redVertical1", positionX: -138, positionY: 0), Lines(itemName: "redVertical2", positionX: -100, positionY: 0), Lines(itemName: "redVertical3", positionX: -63, positionY: 0),],
    [Lines(itemName: "redVertical1", positionX: 138, positionY: 0), Lines(itemName: "redVertical2", positionX:100, positionY: 0), Lines(itemName: "redVertical3", positionX: 63, positionY: 0)],
    [Lines(itemName: "redVertical4", positionX: 0, positionY: -100), Lines(itemName: "redVertical4", positionX: 0, positionY: 100)],
    [Lines(itemName: "redHorizontal1", positionX: 0, positionY: -138), Lines(itemName: "redHorizontal2", positionX: 0, positionY: -100), Lines(itemName: "redHorizontal3", positionX: 0, positionY: -63)],
    [Lines(itemName: "redHorizontal1", positionX: 0, positionY: 138), Lines(itemName: "redHorizontal2", positionX: 0, positionY: 100), Lines(itemName: "redHorizontal3", positionX: 0, positionY: 63)],
    [Lines(itemName: "redHorizontal4", positionX: -100, positionY: 0), Lines(itemName: "redHorizontal4", positionX: 100, positionY: 0)]
    ]
    
    static var yellowLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "yellowVertical1", positionX: -138, positionY: 0), Lines(itemName: "yellowVertical2", positionX: -100, positionY: 0), Lines(itemName: "yellowVertical3", positionX: -63, positionY: 0),],
    [Lines(itemName: "yellowVertical1", positionX: 138, positionY: 0), Lines(itemName: "yellowVertical2", positionX:100, positionY: 0), Lines(itemName: "yellowVertical3", positionX: 63, positionY: 0)],
    [Lines(itemName: "yellowVertical4", positionX: 0, positionY: -100), Lines(itemName: "yellowVertical4", positionX: 0, positionY: 100)],
    [Lines(itemName: "yellowHorizontal1", positionX: 0, positionY: -138), Lines(itemName: "yellowHorizontal2", positionX: 0, positionY: -100), Lines(itemName: "yellowHorizontal3", positionX: 0, positionY: -63)],
    [Lines(itemName: "yellowHorizontal1", positionX: 0, positionY: 138), Lines(itemName: "yellowHorizontal2", positionX: 0, positionY: 100), Lines(itemName: "yellowHorizontal3", positionX: 0, positionY: 63)],
    [Lines(itemName: "yellowHorizontal4", positionX: -100, positionY: 0), Lines(itemName: "yellowHorizontal4", positionX: 100, positionY: 0)]
    ]
    
    static var violetLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "violetVertical1", positionX: -138, positionY: 0), Lines(itemName: "violetVertical2", positionX: -100, positionY: 0), Lines(itemName: "violetVertical3", positionX: -63, positionY: 0),],
    [Lines(itemName: "violetVertical1", positionX: 138, positionY: 0), Lines(itemName: "violetVertical2", positionX:100, positionY: 0), Lines(itemName: "violetVertical3", positionX: 63, positionY: 0)],
    [Lines(itemName: "violetVertical4", positionX: 0, positionY: -100), Lines(itemName: "violetVertical4", positionX: 0, positionY: 100)],
    [Lines(itemName: "violetHorizontal1", positionX: 0, positionY: -138), Lines(itemName: "violetHorizontal2", positionX: 0, positionY: -100), Lines(itemName: "violetHorizontal3", positionX: 0, positionY: -63)],
    [Lines(itemName: "violetHorizontal1", positionX: 0, positionY: 138), Lines(itemName: "violetHorizontal2", positionX: 0, positionY: 100), Lines(itemName: "violetHorizontal3", positionX: 0, positionY: 63)],
    [Lines(itemName: "violetHorizontal4", positionX: -100, positionY: 0), Lines(itemName: "violetHorizontal4", positionX: 100, positionY: 0)]
    ]
    
    static var lightBlueLinesOnGameField: [[Lines]] = [
    [Lines(itemName: "lightBlueVertical1", positionX: -138, positionY: 0), Lines(itemName: "lightBlueVertical2", positionX: -100, positionY: 0), Lines(itemName: "lightBlueVertical3", positionX: -63, positionY: 0),],
    [Lines(itemName: "lightBlueVertical1", positionX: 138, positionY: 0), Lines(itemName: "lightBlueVertical2", positionX:100, positionY: 0), Lines(itemName: "lightBlueVertical3", positionX: 63, positionY: 0)],
    [Lines(itemName: "lightBlueVertical4", positionX: 0, positionY: -100), Lines(itemName: "lightBlueVertical4", positionX: 0, positionY: 100)],
    [Lines(itemName: "lightBlueHorizontal1", positionX: 0, positionY: -138), Lines(itemName: "lightBlueHorizontal2", positionX: 0, positionY: -100), Lines(itemName: "lightBlueHorizontal3", positionX: 0, positionY: -63)],
    [Lines(itemName: "lightBlueHorizontal1", positionX: 0, positionY: 138), Lines(itemName: "lightBlueHorizontal2", positionX: 0, positionY: 100), Lines(itemName: "lightBlueHorizontal3", positionX: 0, positionY: 63)],
    [Lines(itemName: "lightBlueHorizontal4", positionX: -100, positionY: 0), Lines(itemName: "lightBlueHorizontal4", positionX: 100, positionY: 0)]
    ]
}



