//
//  ITArticleViewCell.swift
//  Mini-Forsati
//
//  Created by macbook on 12/05/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class ITArticleViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
   // @IBOutlet weak var dobLabel: UILabel!
  //  @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    override func awakeFromNib() {
      
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
