//
//  MessageModel.swift
//  TinkoffChat
//
//  Created by Aleksandr on 10.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation

class MessageModel: MessageCellConfiguration {
    var messageText: String?
    var isIncoming: Bool
    
    init(messageText:String?, isIncoming:Bool) {
        self.messageText = messageText
        self.isIncoming = isIncoming
    }
    
    static var messages: [MessageModel]{
        get{
            var _messages = [MessageModel]()
            _messages.append(MessageModel(messageText:"Привет!", isIncoming: false))
            _messages.append(MessageModel(messageText:"Привет)", isIncoming: true))
            _messages.append(MessageModel(messageText:"как дела?!", isIncoming: false))
            _messages.append(MessageModel(messageText:"Отлично, а твои?!", isIncoming: true))
            _messages.append(MessageModel(messageText:"Не плохо)", isIncoming: false))
            _messages.append(MessageModel(messageText:"Какая хорошая погода раз два три четыре пять шесть fw", isIncoming: true))
            _messages.append(MessageModel(messageText:"Да уж", isIncoming: false))
            
            return _messages
        }
    }
}
