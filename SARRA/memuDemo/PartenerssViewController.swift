//
//  PartenerssViewController.swift
//  Mini-Forsati
//
//  Created by macbook on 11/05/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class PartenerssViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

   
    @IBOutlet weak var Menu: UIBarButtonItem!
    @IBOutlet weak var mytable: UITableView!
    var Brand = ["Bershka.png","Guess.png","Jules.png","Nike.png"]
    var BrandName = ["Bershka", "Guess", "Jules","Nike"]
  //  @IBOutlet weak var tablepart: UITableView!
    override func viewDidLoad() {
        
        
        // Do any additional setup after loading the view.
        
        revealViewController().rearViewRevealWidth = 200
        Menu.target = revealViewController()
        Menu.action = #selector(SWRevealViewController.revealToggle(_:))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //tableview delegate
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return Brand.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : PartenersViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PartenersViewCell
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?[0] as! PartenersViewCell;
        }
        
    let stringTitle = BrandName[indexPath.row] as String //NOT NSString
    let strCme = Brand[indexPath.row] as String
    cell.lbtitle.text=stringTitle
       cell.lbPhoto.image = UIImage(named: strCme)
        return cell as PartenersViewCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
       if (indexPath.row == 0)   {
     
        let url = URL(string: "http://www.facebook.com")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        }
        
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

