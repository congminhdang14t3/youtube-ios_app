//
//  CacheManager.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/21/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache( _ url:String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
