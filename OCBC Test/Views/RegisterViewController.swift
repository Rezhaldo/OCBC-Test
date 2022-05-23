//
//  RegisterViewController.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 22/05/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var viewBackgroundRegister: UIView!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewBackgroundRegister.backgroundColor = UIColor.white
        viewBackgroundRegister.layer.borderColor = UIColor.black.cgColor
        viewBackgroundRegister.layer.borderWidth = 0.25
        viewBackgroundRegister.layer.shadowOffset = CGSize (width:10, height:10)
        viewBackgroundRegister.layer.shadowRadius = 5
        viewBackgroundRegister.layer.shadowOpacity = 0.3
        
        textFieldUsername.layer.shadowOffset = CGSize(width: 5, height: 5)
        textFieldUsername.layer.shadowRadius = 3
        textFieldUsername.layer.shadowOpacity = 0.2
        textFieldPassword.layer.shadowOffset = CGSize(width: 5, height: 5)
        textFieldPassword.layer.shadowRadius = 3
        textFieldPassword.layer.shadowOpacity = 0.2
        textFieldConfirmPassword.layer.shadowOffset = CGSize(width: 5, height: 5)
        textFieldConfirmPassword.layer.shadowRadius = 3
        textFieldConfirmPassword.layer.shadowOpacity = 0.2
    }

    @IBAction func buttonCancelInTapped(_ sender: Any) {
        self.dismiss(animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
