//
//  ImageViewModel.swift
//  URLSessionEscapingANDCombine
//
//  Created by Apple New on 2022-07-27.
//

import Foundation
import SwiftUI
class ImageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    
    let downloadManager = DownloadManager()
    
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
}
