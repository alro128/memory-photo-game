//
//  Card.swift
//  MemoryPhotoGame
//
//  Created by alvaro on 26/06/2021.
//

import SwiftUI

struct Card: Identifiable {
    
    var id = UUID()
    var pair : Int
    var faceUpImage: Image
    var faceDownImage: Image
    var isFaceUp: Bool = false
    
    func getImage() -> Image {
        if isFaceUp {
            return faceUpImage
        } else {
            return faceDownImage
        }
        //print("loading \(configImages.count) images")
    }
}
