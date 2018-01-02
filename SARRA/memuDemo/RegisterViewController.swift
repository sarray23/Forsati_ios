//
//  RegisterViewController.swift
//  memuDemo
//
//  Created by macbook on 11/04/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//
import Alamofire

import UIKit

class RegisterViewController: UIViewController {
    let URL_USER_REGISTER = "http://forsati.cloudapp.net/forsatiapp/forsatiapp/v1/register.php"

    @IBOutlet weak var txtfusername: UITextField!
  
    @IBOutlet weak var txtfpassword: UITextField!
    @IBOutlet weak var txtfemail: UITextField!
    @IBOutlet weak var txtfname: UITextField!
   
    @IBOutlet weak var txtfphone: UITextField!
    
    
    @IBOutlet weak var labelMessage: UILabel!
    
    /*
     
     @IBOutlet weak var txtfusername: UITextField!
     
     
     @IBOutlet weak var labelMessage: UILabel!
     
     @IBOutlet weak var txtfpassword: UITextField!
     
     @IBOutlet weak var txtfemail: UITextField!
     
     @IBOutlet weak var txtfname: UITextField!
     
     @IBOutlet weak var txtfphone: UITextField!*/
   
    
    
    
    @IBAction func registerAction(_ sender: Any) {
        
        let email=txtfemail.text
        let password=txtfpassword.text
           let name=txtfusername.text
           let phone=txtfphone.text
       // let repeatpassword=repeatpasswordTxt.text
        
        //check if textfields are empty or not
        
        if email!.isEmpty || password!.isEmpty || name!.isEmpty || phone!.isEmpty
        {
            txtfemail.attributedPlaceholder=NSAttributedString(string: "email", attributes:[NSForegroundColorAttributeName:UIColor.red])
            
            
            
            
            txtfpassword.attributedPlaceholder=NSAttributedString(string: "password", attributes:[NSForegroundColorAttributeName:UIColor.red])
            
            
            
            
            
        }
        
        
        
        //check if password and repeat password are equals
        
        /*if(password != repeatpassword)
        {
            // Display an alert message
            displayMyAlertMessage("Passwords do not match");
            return;
            
        }*/
        
        
        
        
        
        
        
        
        
        
        let parameters: Parameters=[
            "username":txtfusername.text!,
            "password":txtfpassword.text!,
            "name":txtfname.text!,
            "email":txtfemail.text!,
            "phone":txtfphone.text!
        ]
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                     
                    
                }
                
        }
       // performSegue(withIdentifier: "listC", sender: self)

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
