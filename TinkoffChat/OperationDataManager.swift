//
//  OperationDataManager.swift
//  TinkoffChat
//
//  Created by Aleksandr on 20.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class OperationDataManager: NSObject, ProfileDataManager {
    
    func saveSettings (name: String?, description: String?, image: UIImage?, nameEdited: Bool, descriptionEdited: Bool, imageEdited: Bool, onComplete: @escaping () -> Void, onFailure: @escaping () -> Void){
        
        let saveOperation = SaveOperation(name: name, description: description, image: image, nameEdited: nameEdited, descriptionEdited: descriptionEdited, imageEdited: imageEdited, onComplete: onComplete, onFailure: onFailure)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(saveOperation)
    }
    
    func getSettings (onComplete: @escaping (String?, String?, UIImage?) -> Void) {
        let getOperation = GetOperation(onComplete: onComplete)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(getOperation)
    }
}


class SaveOperation: Operation {
    var nameData: String?
    var descriptionData: String?
    var imageData: UIImage?
    let nameEditedData: Bool
    let descriptionEditedData: Bool
    let imageEditedData: Bool
    let onCompleteData: () -> Void
    let onFailureData: () -> Void
    
    override open var isAsynchronous: Bool {
        return true
    }
    
    init (name: String?, description: String?, image: UIImage?, nameEdited: Bool, descriptionEdited: Bool, imageEdited: Bool, onComplete: @escaping () -> Void, onFailure: @escaping () -> Void) {
        self.nameData = name
        self.descriptionData = description
        self.imageData = image
        self.nameEditedData = nameEdited
        self.descriptionEditedData = descriptionEdited
        self.imageEditedData = imageEdited
        self.onCompleteData = onComplete
        self.onFailureData = onFailure
        super.init()
    }
    
    override func main() {
        if (nameEditedData) {
            UserDefaults.standard.set(self.nameData, forKey: "name")
        }
        if (descriptionEditedData) {
            UserDefaults.standard.set(self.descriptionData, forKey: "description")
        }
        if (imageEditedData){
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let profileImagePath = NSURL(fileURLWithPath:documentsPath).appendingPathComponent("profileimage.jpg")!
            if let unwrappedImage = imageData {
                do {
                    try unwrappedImage.jpegData(compressionQuality:1.0)!.write(to: profileImagePath, options: .atomic)
                    //return
                }catch {
                    let errorOperation = BlockOperation(block: {
                        self.onFailureData()
                    })
                    let mainQueue = OperationQueue.main
                    mainQueue.addOperation(errorOperation)
                    return
                }
            }
        }
        let completeOperation = BlockOperation(block: {
            self.onCompleteData()
        })
        let mainQueue = OperationQueue.main
        mainQueue.addOperation(completeOperation)
    }
    
}


class GetOperation: Operation {
    let onCompleteData: (String?, String?, UIImage?) -> Void
    var nameData: String?, descriptionData: String?, photoData: UIImage?
    
    override open var isAsynchronous: Bool {
        return true
    }
    
    init (onComplete: @escaping (String?, String?, UIImage?) -> Void) {
        self.onCompleteData = onComplete
        super.init()
    }
    
    override func main() {
        self.nameData = UserDefaults.standard.string(forKey: "name") as String?
        self.descriptionData = UserDefaults.standard.string(forKey: "description") as String?
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let profileImagePath = NSURL(fileURLWithPath:documentsPath).appendingPathComponent("profileimage.jpg")!
        self.photoData = UIImage(contentsOfFile: profileImagePath.path)
        
        let completeOperation = BlockOperation(block: {
            self.onCompleteData(self.nameData, self.descriptionData, self.photoData)
        })
        let mainQueue = OperationQueue.main
        mainQueue.addOperation(completeOperation)
        
    }
}

