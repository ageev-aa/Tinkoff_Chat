//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Aleksandr on 24.09.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var nameEdited: Bool = false
    var descriptionEdited: Bool = false
    var profileImageEdited: Bool = false
    var dataManager: ProfileDataManager = GCDDataManager()
    let operationDataManager = OperationDataManager()
    
    
    @IBOutlet var saveDataActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var profileDescriptionTextView: UITextView!
    @IBOutlet var editDescriptionTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var saveGCDButton: UIButton!
    @IBOutlet var saveOperationButton: UIButton!
    
    @IBAction func closeProfileViewControllerAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editProfileAction(_ sender: Any) {
        self.saveDataActivityIndicator.isHidden = true
        self.saveGCDButton.isEnabled = false
        self.saveOperationButton.isEnabled = false
        self.editDescriptionTextField.isHidden = false
        self.descriptionTextView.isHidden = true
        self.editProfileButton.isHidden = true
        self.addPhotoButton.isHidden = false
        self.nameTextField.isUserInteractionEnabled = true
        self.saveGCDButton.isHidden = false
        self.saveOperationButton.isHidden = false
        self.editDescriptionTextField.text = self.descriptionTextView.text
    }
    
    @IBAction func saveGCDAction(_ sender: UIButton) {
        if (sender.tag == 1){
            self.dataManager = GCDDataManager()
        } else {
            self.dataManager = OperationDataManager()
        }
        
        self.saveDataActivityIndicator.isHidden = false
        self.saveDataActivityIndicator.startAnimating()
        self.saveGCDButton.isEnabled = false
        self.saveOperationButton.isEnabled = false
        dataManager.saveSettings(name: self.nameTextField.text, description: self.editDescriptionTextField.text, image: self.profilePhotoImageView.image,  nameEdited: nameEdited, descriptionEdited: descriptionEdited, imageEdited: profileImageEdited,
            onComplete: { () -> Void in
                self.saveDataActivityIndicator.stopAnimating()
                self.nameTextField.isUserInteractionEnabled = false
                self.descriptionTextView.isHidden = false
                self.editProfileButton.isHidden = false
                self.editDescriptionTextField.isHidden = true
                self.addPhotoButton.isHidden = true
                self.saveGCDButton.isEnabled = false
                self.saveOperationButton.isEnabled = false
                self.saveGCDButton.isHidden = true
                self.saveOperationButton.isHidden = true
                self.nameEdited = false
                self.descriptionEdited = false
                self.profileImageEdited = false
            
                let successSavingAlertController = UIAlertController (title: "Information saved", message: "Press OK to continue", preferredStyle: .actionSheet)
                successSavingAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(successSavingAlertController, animated: true, completion: nil)
                self.setSettings()
            },
            onFailure: { () -> Void in
                let failureSavingAlertController = UIAlertController (title: "Error", message: "Press OK to continue or Repeat", preferredStyle: .actionSheet)
                failureSavingAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) in
                    self.editProfileAction(sender)
                }))
                failureSavingAlertController.addAction(UIAlertAction(title: "Repeat", style: .default, handler: {(action: UIAlertAction) in
                    self.saveGCDAction(sender)
                }))

                self.present(failureSavingAlertController, animated: true, completion: nil)
                    
        })
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
        self.profileImageEdited = true
        self.saveGCDButton.isEnabled = true
        self.saveOperationButton.isEnabled = true
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func nameFieldDidChange(_ textField: UITextField) {
        self.nameEdited = true
        self.saveGCDButton.isEnabled = true
        self.saveOperationButton.isEnabled = true
    }
    
    @objc func descriptionFieldDidChange(_ textField: UITextField) {
        self.descriptionEdited = true
        self.saveGCDButton.isEnabled = true
        self.saveOperationButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editDescriptionTextField.addTarget(self, action: #selector(ProfileViewController.descriptionFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        self.nameTextField.addTarget(self, action: #selector(ProfileViewController.nameFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        self.saveGCDButton.isEnabled = false
        self.saveOperationButton.isEnabled = false
        self.addPhotoButton.isHidden = true
        self.editDescriptionTextField.isHidden = true
        self.nameTextField.isUserInteractionEnabled = false
        self.saveGCDButton.isHidden = true
        self.saveOperationButton.isHidden = true
        self.profileDescriptionTextView.isEditable = false
        
        self.setSettings()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.height/2
        profilePhotoImageView.layer.cornerRadius = addPhotoButton.frame.height/2
        editProfileButton.layer.cornerRadius = editProfileButton.frame.height/4
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setSettings(){
        dataManager.getSettings (onComplete: { (name: String?, description: String?, photo: UIImage?) in
            if let unwrappedName = name {
                self.nameTextField.text = unwrappedName
            }
            if let unwrappedDescription = description {
                self.descriptionTextView.text = unwrappedDescription
            }
            if let unwrappedPhoto = photo {
                self.profilePhotoImageView.image = unwrappedPhoto
            }
        })
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(editProfileButton.frame)
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

