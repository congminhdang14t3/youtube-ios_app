//
//  ViewController.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/18/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    
    var videoArray = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        videoArray = videos
        tableView.reloadData()
    }

    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.VIDEO_CELL_ID, for: indexPath)
    
        let title = self.videoArray[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

