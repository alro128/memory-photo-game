//
//  MemoryBoard.swift
//  MemoryPhotoGame
//
//  Created by taiger on 19/06/2021.
//

import SwiftUI

struct MemoryBoardView: View {
    var body: some View {
        ZStack {
            //Color.green
            VStack {
                HStack {
                    Button {
                        print("click on Back")
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Back")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.frame(width:100, height: 20)
                }.frame(width:360, height: 20, alignment: .leading)
                Spacer()
                HStack {
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                }.padding()
                HStack {
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                    Image("card-red")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height:140)
                }.padding()
                Spacer()
            }
        }
    }
}

struct MemoryBoard_Previews: PreviewProvider {
    static var previews: some View {
        MemoryBoardView()
    }
}
