//
//  ContentView.swift
//  URLSessionEscapingANDCombine
//
//  Created by Apple New on 2022-07-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ImageViewModel()
    
    var body: some View {
        ZStack{
            VStack {
                Text("Today's Image")
                    .frame(width: 200, height: 50, alignment: .center)
                
                if let image = viewModel.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(
                            Circle()
                        )
                        .frame(width: 200, height: 200)
                }else {
                    ProgressView()
                }
            }
            
        }
        .onAppear {
        //MARK: @Escaping Cmbine
            //viewModel.fetchImage()
            
        //MARK: Async
            Task{
                await viewModel.fetch()
            }
        }
    }
    
    func displayImage(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
