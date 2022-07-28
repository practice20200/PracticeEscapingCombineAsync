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
            if let image = viewModel.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            viewModel.fetchImage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
