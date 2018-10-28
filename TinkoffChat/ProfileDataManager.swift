//
//  ProfileDataManager.swift
//  TinkoffChat
//
//  Created by Aleksandr on 22.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation

protocol ProfileDataManager {
    func saveSettings (name: String?, description: String?, image: UIImage?, nameEdited: Bool, descriptionEdited: Bool, imageEdited: Bool, onComplete: @escaping () -> Void, onFailure: @escaping () -> Void)
    
    func getSettings (onComplete: @escaping (String?, String?, UIImage?) -> Void)
}
