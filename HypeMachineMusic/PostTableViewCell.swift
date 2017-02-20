//
//  PostTableViewCell.swift
//  HypeMachineMusic
//
//  Created by Nick McDonald on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit
import AFNetworking

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    var postData: Posting? {
        didSet {
            print("PostData has been set!")
            if let thumbnailURL = postData?.thumbnailLink {
                self.postImageView.setImageWith(thumbnailURL)
            }
            self.artistLabel.text = self.postData?.artistName
            self.titleLabel.text = self.postData?.titleName
            self.rankLabel.text = String(describing: self.postData?.rank)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
//        self.artistLabel.text = self.postData?.artistName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
