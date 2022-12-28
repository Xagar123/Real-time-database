//
//  RegisterViewController.swift
//  messaging App
//
//  Created by Admin on 27/12/22.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet var profileImageGestureRecg: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        profileImageGestureRecg.addTarget(self, action: #selector(self.profileImageClick))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(profileImageGestureRecg)
        
    }
    
    func configureUI() {
        styleTextField(nameTextField)
        styleTextField(emailTextField)
        styleTextField(passwordTextField)
        styleTextField(countryCodeTextField)
        styleTextField(phoneNumberTextField)
        
        cornerRadius(createButton)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        
    }
    
    @objc func profileImageClick() {
        showActionSheet()
        
    }
   
    func showActionSheet() {
        //declaring action sheet
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.showPicker(with: .photoLibrary)
            }
        }
        
        let cancle = UIAlertAction(title: "Cancle", style: .cancel)
        sheet.addAction(library)
        sheet.addAction(cancle)
        
        self.present(sheet, animated: true)
    }
    
    func showPicker(with source: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        present(picker, animated: true)
    }
    
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    private func validateField(name: String,email: String, password: String, phone:String, countryCode: String ) -> Bool {

        if isValid(email: email) && name != "" && isValid(phone: phone) && password.count >= 6 && countryCode != "" {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func cancleButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
