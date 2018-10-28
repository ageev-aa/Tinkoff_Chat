//
//  GCDDataManager.swift
//  TinkoffChat
//
//  Created by Aleksandr on 20.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class GCDDataManager: NSObject, ProfileDataManager {
    
    let globalQueue = DispatchQueue.global(qos: .default)
    
    func saveSettings (name: String?, description: String?, image: UIImage?, nameEdited: Bool, descriptionEdited: Bool, imageEdited: Bool, onComplete: @escaping () -> Void , onFailure: @escaping () -> Void){

        globalQueue.async {
            if (nameEdited) {
                UserDefaults.standard.set(name, forKey: "name")
            }
            if (descriptionEdited) {
                UserDefaults.standard.set(description, forKey: "description")
            }
            if (imageEdited){
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                let profileImagePath = NSURL(fileURLWithPath:documentsPath).appendingPathComponent("profileimage.jpg")!
                if let unwrappedImage = image {
                    do {
                        try unwrappedImage.jpegData(compressionQuality:1.0)!.write(to: profileImagePath, options: .atomic)
                        //return
                    }catch {
                        DispatchQueue.main.async {
                            onFailure()
                        }
                        return
                    }
                }
            }
            
            DispatchQueue.main.async {
                onComplete()
            }
        }
    }
    
    func getSettings (onComplete: @escaping (String?, String?, UIImage?) -> Void) {
        var name: String?, description: String?, photo: UIImage?
        globalQueue.async {
            name = UserDefaults.standard.string(forKey: "name") as String?
            description = UserDefaults.standard.string(forKey: "description") as String?
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let profileImagePath = NSURL(fileURLWithPath:documentsPath).appendingPathComponent("profileimage.jpg")!
            photo = UIImage(contentsOfFile: profileImagePath.path)
            DispatchQueue.main.async {
                onComplete(name, description, photo)
            }
        }
    }
}
