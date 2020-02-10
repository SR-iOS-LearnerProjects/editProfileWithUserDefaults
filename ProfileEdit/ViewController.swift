//
//  ViewController.swift
//  ProfileEdit
//
//  Created by Sridatta Nallamilli on 03/01/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var mobNo: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        profileName.delegate = self
        emailID.delegate = self
        
        self.profileImg.layer.cornerRadius = self.profileImg.frame.height / 2.0
        
        self.saveBtn.layer.cornerRadius = self.saveBtn.frame.height / 2.0
        
    }

    @IBAction func editImg(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveChanges(_ sender: UIButton) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mobNo.resignFirstResponder()
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImg.image = image
        }
        dismiss(animated: true, completion: nil)
        
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
