//
//  ViewController.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/18/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

