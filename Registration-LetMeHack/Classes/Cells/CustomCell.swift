//
//  CustomCell.swift
//  Examples
//
//  Created by Yong Su on 7/24/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let answerLabel = UILabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 0)
        
        // configure detailLabel
        contentView.addSubview(answerLabel)
        answerLabel.lineBreakMode = .byWordWrapping
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        answerLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        answerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        answerLabel.numberOfLines = 0
        answerLabel.font = UIFont.systemFont(ofSize: 12)
        answerLabel.textColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

