//
//  ImageViewModel.swift
//  URLSessionEscapingANDCombine
//
//  Created by Apple New on 2022-07-27.
//

import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    let downloadManager = DownloadManager()
    
    var cancellable = Set<AnyCancellable>()
    
    //MARK: @Escaping
    /*
    func fetchImage(){
        downloadManager.downloadImage { [weak self] image, error in
            guard let image = image, error == nil else {
                print("error in ImageViewModel: \(String(describing: error?.localizedDescription))")
                return }

            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    */
    
    //MARK: Combine
    /*
    func fetchImage(){
        downloadManager.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellable)

    }
     */
    
    func fetch() async{
        let image = try? await downloadManager.downloadWithAsync()
        await MainActor.run {
            self.image = image
        }
       
    }
    
}
