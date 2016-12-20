//
//  PerfilViewController.swift
//  ADefinir
//
//  Created by Student on 12/19/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var perfilCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.perfilCard.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor
        self.perfilCard.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        self.perfilCard.layer.shadowOpacity = 1.0
        self.perfilCard.layer.shadowRadius = 1.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
