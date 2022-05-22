//
//  ViewController.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 19/05/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldUsernameEntry: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelAlertUsername: UILabel!
    @IBOutlet weak var labelAlertPassword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldUsernameEntry.delegate = self
        textFieldPassword.delegate = self
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        self.textFieldUsernameEntry.resignFirstResponder()
        self.textFieldPassword.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func buttonLoginInTapped(_ sender: Any) {
        if textFieldPassword.hasText && textFieldUsernameEntry.hasText {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
            dashboardViewController.modalPresentationStyle = .fullScreen
            self.present(dashboardViewController, animated: true, completion: nil)
        }
        
        if textFieldUsernameEntry.hasText{
            labelAlertUsername.isHidden = true
        }else{
            labelAlertUsername.isHidden = false
        }
        
        if textFieldPassword.hasText{
            labelAlertPassword.isHidden =  true
        }else{
            labelAlertPassword.isHidden = false
        }
    }
    
    
}

