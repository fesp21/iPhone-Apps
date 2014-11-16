//
//  TableViewCell.swift
//  Swiffer
//
//  Created by Sandeep on 9/22/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imageBox: UIImageView? = UIImageView()
    
    @IBOutlet weak var userName: UILabel? = UILabel()
    
    @IBOutlet weak var time: UILabel? = UILabel()
    
    @IBOutlet var textView: UITextView? = UITextView()
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
