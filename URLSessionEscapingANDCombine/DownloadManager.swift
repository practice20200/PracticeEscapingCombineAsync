//
//  DownloadManager.swift
//  URLSessionEscapingANDCombine
//
//  Created by Apple New on 2022-07-27.
//

import Foundation
import UIKit
import Combine

class DownloadManager{
    let url = URL(string: "https://picsum.photos/200")
    
    func responseHandler(data: Data?, response: URLResponse?) -> UIImage?{
        guard let data = data,
              let image = UIImage(data: data),
              let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            print("Error in responseHandler:")
             return nil
        }
        return image
    }
    
    
    //MARK: @EScaping
    /*
    func downloadImage(completion: @escaping (_ image: UIImage?, _ error: Error?) -> ()){
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, response, error in
            print("Error in downloadImage:\(String(describing: error?.localizedDescription))")
            let image = self?.responseHandler(data: data, response: response)
            completion(image, error)
        }
        task.resume()

    }
     */
    
    //MARK: Combine
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error>{
        URLSession.shared.dataTaskPublisher(for: url ?? URL(string: "")!)
            .map(responseHandler)
            .mapError({$0})
            .eraseToAnyPublisher()
    }
    
}
