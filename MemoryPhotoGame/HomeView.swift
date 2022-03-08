//
//  ContentView.swift
//  MemoryPhotoGame
//
//  Created by taiger on 19/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .center, spacing:20) {
                    Text("Memory Photo Game")
                        .font(.system(size:32, weight: .bold, design: .rounded))
                    Text("Choose 3 photos from you photo library and start playing!")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .padding()
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                        ConfigImageView(viewModel: viewModel, configId: 0)
                        ConfigImageView(viewModel: viewModel, configId: 1)
                        ConfigImageView(viewModel: viewModel, configId: 2)
                    }
                    NavigationLink(destination: BoardView(viewModel: viewModel)) {
                        StartButtonView()
                    }.simultaneousGesture(TapGesture().onEnded{
                        viewModel.startGame()
                    })
                }.frame(maxWidth:400)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ConfigImageView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    @State var configId : Int
    //@State var configImage : Image
    @State private var imagePicked : UIImage?
    @State private var showingImagePicker = false

    
    var body: some View {
        VStack {
            viewModel.getImage(index: configId)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height:140)
            Button(action: {
                print("Change photo was tapped")
                self.showingImagePicker = true
            }) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.accentColor)
                Text("Change Photo")
                    .font(.system(size:12, weight: .regular, design: .default))
                    .foregroundColor(.accentColor)
            }
        }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(image: self.$imagePicked)
        }
    }
    
    func loadImage(){
        guard let inputImage = imagePicked else { return }
        viewModel.replaceImage(id: configId, image: Image(uiImage: inputImage))
    }
    
}

struct StartButtonView: View {
        
    var body: some View {
            Text("Start Game")
                .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("accentSecondaryColor"))
                .background(Color.accentColor)
                .font(.system(size:20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
