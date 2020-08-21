//
//  DetailViewController.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/21/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var youtubeWebview: WKWebView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        
        guard video != nil else {
            return
        }
        
        let embedUrlString = Constant.YT_EMBED_URL + video!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        youtubeWebview.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        let date = df.string(from: video!.published)
        dateLabel.text = date
        
        descriptionTextView.text = video!.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
