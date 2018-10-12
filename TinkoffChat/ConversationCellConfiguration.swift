//
//  ConversationCellConfiguration.swift
//  TinkoffChat
//
//  Created by Aleksandr on 08.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation

protocol ConversationCellConfiguration: class{
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}
