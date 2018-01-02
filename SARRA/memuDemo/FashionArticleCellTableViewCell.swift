//
//  FashionArticleCellTableViewCell.swift
//  memuDemo
//
//  Created by macbook on 11/04/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class FashionArticleCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
