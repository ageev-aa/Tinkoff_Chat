//
//  MessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Aleksandr on 08.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell, MessageCellConfiguration {
    
    @IBOutlet weak var outgoingMessageView: UIView!
    
    @IBOutlet weak var outgoingMessageLabel: UILabel!
    @IBOutlet weak var incomingMessageLabel: UILabel!
    @IBOutlet weak var incomingMessageView: UIView!
    
    var messageText: String?
    
    var isIncoming: Bool = false {
        didSet {
            if isIncoming {
                incomingMessageView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
                incomingMessageView.layer.cornerRadius = 20
                self.incomingMessageLabel.text = messageText
                outgoingMessageView.removeFromSuperview()
            } else{
                outgoingMessageView.backgroundColor = UIColor(red: 0.3, green: 0.6, blue: 1.0, alpha: 1.0)
                outgoingMessageView.layer.cornerRadius = 20
                self.outgoingMessageLabel.text = messageText
                incomingMessageView.removeFromSuperview()
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
