//
//  PostCell.swift
//  Feedwes
//
//  Created by FV iMAGINATION on 15/09/15.
//  Copyright (c) 2015 FV iMAGINATION. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    /* Views */
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
override func prepareForReuse() {
        super.prepareForReuse()
    
    self.postImage.image = nil
}
    
    
    
}
