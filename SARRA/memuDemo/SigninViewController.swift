//
//  SigninViewController.swift
//  memuDemo
//
//  Created by macbook on 11/04/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
import Alamofire
import FBSDKCoreKit
import FBSDKLoginKit


//import FBSDKLoginKit

class SigninViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var FbB: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!
    
    @IBOutlet weak var login_button: UIButton!
    // @IBOutlet weak var login_button: UIButton!
    // @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var  user :User!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        
        
        if (FBSDKAccessToken.current() == nil) {
            print("Not loged in..")
        } else {
            print("Loged in...")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        
        
        if( defaults.object(forKey: "User_connected") != nil)
        {
            // let alert = UIAlertController(title: "Signin", message: "Session storage works ...", preferredStyle: .alert)
            // let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            // alert.addAction(okAction)
            // self.present(alert, animated: true, completion: nil)
            self.performSegue(withIdentifier: "profile", sender: self)
            
        }
    }
    
    
    
    
    @IBAction func loginAc(_ sender: Any) {
        
        if (self.email.text! == "" || self.password.text! == "" ) {
            let alert = UIAlertController(title: "Sign in Failed", message: "Please enter Email Address and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            //   actInd.stopAnimating()
        }
        else { let urll:String = "http://forsati.cloudapp.net/forsatiapp/forsatiapp/v1/ForssatiLogin.php"
            let mail : String =  (self.email.text)!
            let pass : String = (self.password.text)!
            let param : Parameters =  [ "mail" : mail, "password" : pass ]
            print(urll)
            Alamofire.request(urll, method: .get, parameters: param).responseJSON  {
                response in
                switch response.result {
                case .success(let JSON):
                    print("successss")
                    let obj = JSON as! NSDictionary
                    let id = Int(obj.object(forKey: "id") as! String)
                    let fn = obj.object(forKey: "username")as! String
                    let pass = obj.object(forKey: "password")as! String
                    //print(birth)
                    
                    self.user = User(aId: id, aFN: fn, password: pass)
                    print(self.user.description)
                    let encodedPlayer = NSKeyedArchiver.archivedData(withRootObject: self.user)
                    let defaults = UserDefaults.standard
                    defaults.set(encodedPlayer, forKey: "User_connected")
                    defaults.synchronize()
                    let alert = UIAlertController(title: "Signin", message: "Welcome Back...", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    self.performSegue(withIdentifier: "profile", sender: self)
                    
                    return
                    
                    
                    
                case .failure(let error):
                    let alert = UIAlertController(title: "Signin", message: " Request failed with error: \(error) ...", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                    //self.displayAlertMessage(messageToDisplay: "Error while processing your request: \(error)")
                    print("Request failed with error: \(error)")
                }
            }
        }
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //partie fb api
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        
        if error == nil
        {
            print("login completed...")
            self.performSegue(withIdentifier: "profile", sender: self)
        }
        else
        {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Loged out...")
        
        
    }
    
}
