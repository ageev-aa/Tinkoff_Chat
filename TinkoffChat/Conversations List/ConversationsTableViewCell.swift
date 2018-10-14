//
//  ConversationsTableViewCell.swift
//  TinkoffChat
//
//  Created by Aleksandr on 04.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class ConversationsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var message: String? {
        didSet {
            if let unwrappedMessage = message {
                lastMessageLabel.text = unwrappedMessage
                lastMessageLabel.font = UIFont.systemFont(ofSize: 15.0)
            } else {
                lastMessageLabel.text = "No messages yet"
                lastMessageLabel.font = UIFont.italicSystemFont(ofSize: 15.0)
            }
        }
    }
    
    var online: Bool = true {
        didSet {
            self.backgroundColor = online ? #colorLiteral(red: 0.9738112092, green: 0.9553682208, blue: 0.5330520868, alpha: 0.4192618534) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var date: Date? {
        didSet {
            if let unwrappedDate = date {
                let today = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "ru_RU")
                formatter.dateFormat = unwrappedDate < today ? "dd MMM HH:mm" : "HH:mm"
                dateLabel.text = formatter.string(from: unwrappedDate)
            } else {
                dateLabel.text = ""
            }
        }
    }
    
    var hasUnreadMessages: Bool = false{
        didSet {
            if hasUnreadMessages {
                lastMessageLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            }
        }
    }
    
    
    func configureCell(configuration: ConversationCellConfiguration) {
        self.name = configuration.name
        self.message = configuration.message
        self.date = configuration.date
        self.online = configuration.online
        self.hasUnreadMessages = configuration.hasUnreadMessages
    }

}
