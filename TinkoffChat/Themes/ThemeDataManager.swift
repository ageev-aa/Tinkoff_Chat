//
//  ThemeDataManager.swift
//  TinkoffChat
//
//  Created by Aleksandr on 28.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation


@objc class ThemeDataManager: NSObject {
    let globalQueue = DispatchQueue.global(qos: .default)
    
    public func saveTheme (theme: String?) -> Void {
        globalQueue.async {
                UserDefaults.standard.set(theme, forKey: "theme")
            }
        }
    
    public func getTheme (onComplete: @escaping (String?) -> Void) {
        var theme: String?
        globalQueue.async {
            theme = UserDefaults.standard.string(forKey: "theme") as String?
            DispatchQueue.main.async {
                onComplete(theme)
            }
        }
    }
}
