//
//  MessageCellConfiguration.swift
//  TinkoffChat
//
//  Created by Aleksandr on 08.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation

protocol MessageCellConfiguration: class{
    var messageText:String? {get set}
    var isIncoming: Bool {get set}
}

