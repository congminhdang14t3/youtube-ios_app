//
//  VideoTableViewCell.swift
//  youtube-ios-app
//
//  Created by Dang Cong Minh on 8/21/20.
//  Copyright © 2020 Dang Cong Minh. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    
    func setCell(_ v: Video) {
        video = v
        
        guard video != nil else {
            return
        }
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        let date = df.string(from: video!.published)
        dateLabel.text = date
        
        // Set the thumbnail
        
        guard video!.thumbnail != "" else {
            return
        }
        
        if let cacheData = CacheManager.getVideoCache(video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
//        print(video!.thumbnail)
        let url = URL(string: video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if data == nil || error != nil {
                return
            }
            
            if url!.absoluteString != self.video!.thumbnail {
                return
            }
            
            let image = UIImage(data: data!)
            
            DispatchQueue.main.async {
                self.thumbnailImageView!.image = image
            }
            
            CacheManager.setVideoCache(url!.absoluteString, data)
        }
        dataTask.resume()
        
        
    }

}
