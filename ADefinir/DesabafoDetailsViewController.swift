//
//  DesabafoDetailsViewController.swift
//  ADefinir
//
//  Created by Student on 12/20/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import UIKit

class DesabafoDetailsViewController: UIViewController {

    @IBOutlet weak var mainCard: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCard.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor
        self.mainCard.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        self.mainCard.layer.shadowOpacity = 1.0
        self.mainCard.layer.shadowRadius = 1.0

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
