//
//  OutgoingMessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Aleksandr on 10.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class OutgoingMessageTableViewCell: UITableViewCell, MessageCellConfiguration {
    
    
    @IBOutlet weak var outgoingMessageView: UIView!
    @IBOutlet weak var outgoingMessageLabel: UILabel!
    @IBOutlet weak var outgoingMessageLeftConstraint: NSLayoutConstraint!
    
    
    var messageText: String? {
        didSet{
            outgoingMessageView.backgroundColor = UIColor(red: 0.3, green: 0.6, blue: 1.0, alpha: 1.0)
            outgoingMessageView.layer.cornerRadius = 20
            outgoingMessageLabel.text = messageText
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
        self.outgoingMessageLeftConstraint.constant = self.contentView.frame.width/4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
