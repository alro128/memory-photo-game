//
//  MemoryBoardView.swift
//  MemoryPhotoGame
//
//  Created by taiger on 26/06/2021.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing:20){
                Spacer()
                HStack {
                    CardView(viewModel: viewModel, index: 0)
                    CardView(viewModel: viewModel, index: 1)
                    CardView(viewModel: viewModel, index: 2)
                }
                HStack {
                    CardView(viewModel: viewModel, index: 3)
                    CardView(viewModel: viewModel, index: 4)
                    CardView(viewModel: viewModel, index: 5)
                }.padding()
                PlayAgainButtonView(viewModel: viewModel)
                Spacer()
            }.frame(maxWidth:320)
            .onAppear(perform: {
                viewModel.startGame()
            })
        }
    }
}



struct CardView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    @State var index : Int
    
    var body: some View {
        Button {
            if !viewModel.gameFinished {
                viewModel.flip(index: index)
            }
        } label: {
//            viewModel.getCard(index: index)
            viewModel.board[index].getImage()
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height:160)
                .padding(1)
        }
    }
    
}

struct PlayAgainButtonView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    //@State playAgainHide = true
    
    var body: some View {
        Button(action: {
            viewModel.startGame()
        }, label: {
            Text("Play again")
                .frame(width: 280, height: 50, alignment: .center)
                .foregroundColor(Color("accentSecondaryColor"))
                .background(Color.accentColor)
                .font(.system(size:20, weight: .bold, design: .default))
                .cornerRadius(10)
        }).opacity(viewModel.gameFinished ? 1 : 0) //should hide
    }
}

struct MemoryBoard_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel()
        BoardView(viewModel: game)
    }
}
