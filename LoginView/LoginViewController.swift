//
//  LoginViewController.swift
//  messaging App
//
//  Created by Admin on 27/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTextField(emailTextField)
        styleTextField(passwordTextField)
        configureUI()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    private func configureUI() {
        cornerRadius(loginButton)
        
        
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        let createAccountVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(createAccountVC!, animated: true)
    }
    
    
    
    
    @IBAction func registerButtonClick(_ sender: UIButton) {
    }
    

}
