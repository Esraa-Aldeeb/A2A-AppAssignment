//
//  LoginViewController.swift
//  AppAssigment
//
//  Created by Esraa Aldeeb on 8/17/18.
//  Copyright © 2018 AccessToArabia. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController,UITextFieldDelegate {
  @IBOutlet var tfEmail: UITextField!
  @IBOutlet var tfPassword: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.tfEmail.delegate = self
    self.tfPassword.delegate = self
    }
  
  @IBAction func loginPressed(_ sender: Any) {
    if tfEmail.text?.isEmpty ?? true || tfPassword.text?.isEmpty ?? true {
      let emptyFieldAlertController = UIAlertController(title:"", message: "Please Enter your email and password", preferredStyle: .alert)
      let okButton = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
      }
      emptyFieldAlertController.addAction(okButton)
      self.present(emptyFieldAlertController, animated: true, completion: nil)
    }
    else{
      if (tfEmail.text?.isValidEmail())! {
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { (authResult, error) in
          self.performSegue(withIdentifier: "listOfRepository", sender: self)
        }
      }
      else{
        let emailFormateAlertController = UIAlertController(title:"", message: "email formate not correct", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
        }
        emailFormateAlertController.addAction(okButton)
        self.present(emailFormateAlertController, animated: true, completion: nil)
      }
    }
  }
  //MARK:- TextField Delegate Methods
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
