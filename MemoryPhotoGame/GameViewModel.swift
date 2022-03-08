//
//  GameViewModel.swift
//  MemoryPhotoGame
//
//  Created by alvaro on 26/06/2021.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published private var configImages : [Image] = Helper.defaultImages
    @Published public var board : [Card] = []
    @Published private var selected : Set<Int> = []
    @Published public var gameFinished : Bool = false
    private var pairMatches : Int = 0
    
    func getImage(index: Int) -> Image {
        //print("Get config image \(index)")
        return configImages[index]
    }
    
    func getImagesNames() -> Void {
        //print("loading \(configImages.count) images")
    }
    
    
    func getImages() -> [Image] {
        //print("Get images \(configImages.count)")
        return configImages
    }
    
    func setImages(imgs:[Image]) {
        //print("Set images \(imgs.count)")
        self.configImages=imgs
    }
    
    func startGame() {
        print("Starting a new game")
        gameFinished = false
        board.removeAll()
        selected.removeAll()
        var i : Int = 0
        for img in configImages {
            board.append(Card(pair: i, faceUpImage: img, faceDownImage: Helper.faceDownImage))
            board.append(Card(pair: i, faceUpImage: img, faceDownImage: Helper.faceDownImage))
            i+=1
            print("new board \(board.count)")
        }
        pairMatches = 0
        board.shuffle()
    }
    
    func getCard(index: Int) -> Image {
        if board[index].isFaceUp {
            return board[index].faceUpImage
        } else {            
            return board[index].faceDownImage
        }
    }
    
    func flip(index: Int) {
        print("Card selected \(index) of \(selected.count) . pairs \(pairMatches)")
        if (selected.count == 2) {
            if !pairMatch() {
                print("selected count \(selected.count)")
                resetFaceUp(c: selected)
            } else {
                pairMatches += 1
            }
            selected.removeAll()
            if pairMatches == 3 {
                gameFinished = true
                print("Game finished!")
            } else {
                gameFinished = false
            }
        }
        selected.insert(index)
        board[index].isFaceUp = true
    }
    
    private func pairMatch() -> Bool {
        return board[selected.min()!].pair == board[selected.max()!].pair ? true : false
    }
    
    func isGameFinished() -> Bool {
        print("pairMatches \(pairMatches)")
        if pairMatches == 3 {
            gameFinished = true
        } else {
            gameFinished = false
        }
        return gameFinished //pairMatches == 3 ? true : false
    }
    
    func replaceImage(id: Int, image:Image) {
        configImages[id] = image
    }
    
    @objc func resetFaceUp(c: Set<Int>) {
        c.forEach { s in
            board[s].isFaceUp = false
        }
    }
    
//    public func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, closure: @escaping () -> Void) {
//        let dispatchTime = DispatchTime.now() + seconds
//        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
//    }
//
//    public enum DispatchLevel {
//        case main, userInteractive, userInitiated, utility, background
//        var dispatchQueue: DispatchQueue {
//            switch self {
//            case .main:                 return DispatchQueue.main
//            case .userInteractive:      return DispatchQueue.global(qos: .userInteractive)
//            case .userInitiated:        return DispatchQueue.global(qos: .userInitiated)
//            case .utility:              return DispatchQueue.global(qos: .utility)
//            case .background:           return DispatchQueue.global(qos: .background)
//            }
//        }
//    }
       
}
