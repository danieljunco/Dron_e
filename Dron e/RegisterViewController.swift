//
//  RegisterViewController.swift
//  Dron e
//
//  Created by Daniel Junco on 4/7/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var button: CustomButton!
    var isSign: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppereance = self.navigationController!.navigationBar
        navigationBarAppereance.isHidden = false
        navigationBarAppereance.barTintColor = UIColor.gray
        navigationBarAppereance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBarAppereance.tintColor = UIColor.white
        navigationController!.toolbar.barTintColor = UIColor.black
        navigationController!.toolbar.isTranslucent = true
        navigationController!.toolbar.tintColor = UIColor.white
    }
    
    @IBAction func signInSelectorChanged(_ sender: Any) {
        isSign = !isSign
        if isSign {
            button.setTitle("Iniciar", for: .normal)
        }
        else{
            button.setTitle("Registrar", for: .normal)
        }
    }
    @IBAction func buttonTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            
            if isSign {
                FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                    if let u = user {
                        print("Usuario se registro \(u)")
                        self.performSegue(withIdentifier: "GoToDashBoard", sender: self)
                    }else{
                        GlobalVariables.sharedInstance.displayAlertMessage(view: self, messageToDisplay: (error?.localizedDescription)!)
                    }
                })
            }else {
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    if let u = user {
                        print("Usuario se registro \(u)")
                        self.performSegue(withIdentifier: "GoToDashBoard", sender: self)
                    }else {
                        GlobalVariables.sharedInstance.displayAlertMessage(view: self, messageToDisplay: (error?.localizedDescription)!)
                    }
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
}
