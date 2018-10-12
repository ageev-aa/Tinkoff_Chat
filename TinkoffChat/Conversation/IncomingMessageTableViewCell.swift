//
//  IncomingMessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Aleksandr on 10.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class IncomingMessageTableViewCell: UITableViewCell, MessageCellConfiguration {
    
    
    @IBOutlet weak var incomingMessageView: UIView!
    @IBOutlet weak var incomingMessageLabel: UILabel!
    @IBOutlet weak var incomingMessageRightConstraint: NSLayoutConstraint!
    
    
    var messageText: String? {
        didSet{
            incomingMessageView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
            incomingMessageView.layer.cornerRadius = 20
            incomingMessageLabel.text = messageText
        }
    }
    
    var isIncoming: Bool = false{
        didSet{
            
        }
    }
    
    func configureCell(configuration: MessageCellConfiguration) {
        self.messageText = configuration.messageText
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.incomingMessageRightConstraint.constant = self.contentView.frame.width/4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
}
