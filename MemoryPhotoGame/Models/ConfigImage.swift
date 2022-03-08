//
//  ConfigImage.swift
//  MemoryPhotoGame
//
//  Created by taiger on 03/07/2021.
//


import SwiftUI

struct ConfigImage : Identifiable {
    var id = UUID()
    @State public var name: String!
    @State public var image: Image!
    
    init(name: String, image: Image) {
        self.name = name
        self.image = image
    }
    
}
