//
//  ViewController.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 19/05/22.
//

import UIKit
import Alamofire

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
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
//            dashboardViewController.modalPresentationStyle = .fullScreen
//            self.present(dashboardViewController, animated: true, completion: nil)
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
        
        let loginRequest = LoginRequest(username: textFieldUsernameEntry.text ?? "", password: textFieldPassword.text ?? "")
        let header = HTTPHeaders(["Content-Type":"application/json", "Accept":"application/json"])
        let loginUrl = URL(string: "https://green-thumb-64168.uc.r.appspot.com/login")
//        Alamofire.Session().request(loginUrl, method: .post, parameters: loginRequest, encoder: JSONEncoding.default, headers: "").responseJSON(completionHandler: { response in
//
//        } )
        
        AF.request(loginUrl!, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default, headers: header).response(completionHandler: { response in
//            print("response \(response.debugDescription)")
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                print("Success request: \(loginResponse)")
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
                dashboardViewController.modalPresentationStyle = .fullScreen
                self.present(dashboardViewController, animated: true, completion: nil)
                
            } catch let error {
                print("Error request: \(error.localizedDescription)")
            }
        })
        
//        Alamofire.Session().request(loginUrl!, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default, headers: header).response(completionHandler: { response in
//            print("response \(response.debugDescription)")
//            guard let data = response.data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
//                print("Success request: \(loginResponse)")
//
//            } catch let error {
//                print("Error request: \(error.localizedDescription)")
//            }
//        })
      
        
    }
    
    
}

