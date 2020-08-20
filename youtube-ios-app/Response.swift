//
//  Response.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/20/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var items: [Video]?
    
    enum Codingkeys: String, CodingKey {
        
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
        
        
    }
}
