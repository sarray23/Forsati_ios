//
//  AboutViewController.swift
//  Mini-Forsati
//
//  Created by macbook on 12/05/2017.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController ,UINavigationBarDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var menu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
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
