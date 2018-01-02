//
//  DetailViewController.swift
//  Mini-Forsati
//
//  Created by macbook on 09/05/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    
    
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var img: UIImageView!
    
    
 
    
    var imageString:String!
    var dobString:String!
    var nameString:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()

//self.updateUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
  
    func updateUI() {
        self.nameLabel.text = nameString
        self.dobLabel.text = dobString
        
        let imgURL = URL(string:imageString)
        
        let data = NSData(contentsOf: (imgURL)!)
        self.img.image = UIImage(data: data as! Data)
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
