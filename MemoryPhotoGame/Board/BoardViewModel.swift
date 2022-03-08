//
//  BoardViewModel.swift
//  MemoryPhotoGame
//
//  Created by taiger on 03/07/2021.
//

import Foundation
import SwiftUI


extension BoardView {
    
    class BoardViewModel:ObservableObject {
        
        @Published private var board: [Card] = []
        var selectedImages: [Image]
        
        init(images: [Image]){
            self.selectedImages = images
            setBoard()
        }
            
        
        func setBoard() {
            var i : Int = 0
            for img in selectedImages {
                board.append(Card(pair: i, faceUpImage: img, faceDownImage: Helper.faceDownImage))
                board.append(Card(pair: i, faceUpImage: img, faceDownImage: Helper.faceDownImage))
                i+=1
            }
            
        }
        //    func flip() {
        //        isFaceUp.toggle()
        //        print("Card flipped.  Is Face Up \(isFaceUp) ")
        //    }
        //
        //    func isFlipped() -> Bool {
        //        print("Is Face Up \(isFaceUp) ")
        //        return isFaceUp
        //    }
        //
        //    func getImage() -> Image {
        //        print("getting image")
        //        if(isFlipped()) {
        //            return faceUpImage
        //        } else {
        //            return Helper.faceDownImage
        //        }
        //    }
        //
        //    func getConfigImage() -> Image {
        //        return faceUpImage
        //    }
        
    }
}
