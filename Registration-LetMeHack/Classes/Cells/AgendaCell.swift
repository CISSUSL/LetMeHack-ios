//
//  AgendaCell.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/13/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit

class AgendaCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var lineLableBottom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
