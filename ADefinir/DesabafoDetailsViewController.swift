//
//  DesabafoDetailsViewController.swift
//  ADefinir
//
//  Created by Student on 12/20/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import UIKit

class DesabafoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var mainCard: CardView!
    @IBOutlet weak var desabafoImagem: CardView!
    @IBOutlet weak var desabafoTitulo: UILabel!
    @IBOutlet weak var desabafoConteudo: UITextView!
    
    let comentarios = [Comentario]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCard.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor
        self.mainCard.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        self.mainCard.layer.shadowOpacity = 1.0
        self.mainCard.layer.shadowRadius = 1.0
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "comentarioIdentifier")
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "comentarioIdentifier")


        
        cell.textLabel?.text = "Teste"
        cell.detailTextLabel?.text = "teste teste teste"
        
        return cell
    }

}
