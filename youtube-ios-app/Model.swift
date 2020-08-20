//
//  Model.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/20/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import Foundation

class Model {
    
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
        }
        
        dataTask.resume() 
    }
}
