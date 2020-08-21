//
//  Model.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/20/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
        func getVideos() {
        
        let url = URL(string: Constant.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if data == nil || error != nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if let videos = response.items {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(videos)
                    }
                }
                
            } catch {
                print("Throws error: \(error)")
            }
            
            
        }
        
        dataTask.resume()
        
    }
}
