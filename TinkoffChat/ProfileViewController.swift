//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Aleksandr on 24.09.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var profileDescriptionTextView: UITextView!
    @IBAction func closeProfileViewControllerAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func setProfilePhototAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let setProfilePhotoAlert = UIAlertController (title: "Add profile photo", message: "Choose source", preferredStyle: .actionSheet)
        setProfilePhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "Camera is not avalible", preferredStyle: .actionSheet)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
            
        }))
        
        setProfilePhotoAlert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: {(action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = false
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        setProfilePhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(setProfilePhotoAlert, animated: true, completion: nil)
        
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let croppedImage = image?.cgImage?.cropping(to: CGRect(x:(image?.size.width)!/2 - min((image?.size.width)!, (image?.size.height)!)/2, y:(image?.size.height)!/2 - min((image?.size.width)!, (image?.size.height)!)/2, width:min((image?.size.width)!, (image?.size.height)!), height:min((image?.size.width)!, (image?.size.height)!)))
        self.profilePhotoImageView.image = UIImage(cgImage : croppedImage!)
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //print("\(#function): \(editProfileButton.frame)")
        //unexpectedly found nil while unwrapping an Optional value
        // на данном этапе view еще не существует, editButton = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(editProfileButton.frame)
        profileDescriptionTextView.isEditable = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.height/2
        profilePhotoImageView.layer.cornerRadius = addPhotoButton.frame.height/2
        editProfileButton.layer.cornerRadius = editProfileButton.frame.height/4
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func openGallery(){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(editProfileButton.frame)
        // отличаются, потому что во viewDidLoad данные берутся из сториборда. viewDidAppear вызывается после
        // того, как view появляется на экране (и размеры уже известны)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

