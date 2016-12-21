//
//  HomeViewController.swift
//  ADefinir
//
//  Created by Student on 12/19/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mainCard: UIView!
    
    let frontView = UIView()
    let backView = UIView()
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    private var showingBack = false
    
    var listaDesabafos = [Desabafo]()
    
//    var currentDesabafo: Desabafo? {
//        didSet {
//            
//            print("Mudei o desabafo!")
//            
//            cardTitleLabel?.text = currentDesabafo?.titulo
//            cardDescriptionLabel?.text = currentDesabafo?.descricao
//        }
//    }
    
    // Card Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCard.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor
        self.mainCard.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        self.mainCard.layer.shadowOpacity = 1.0
        self.mainCard.layer.shadowRadius = 1.0
        
        cardTitleLabel.text = "-"
        cardDescriptionLabel.text = "-"
        
        self.mainCard.addSubview(activityIndicator)
                activityIndicator.frame = self.mainCard.bounds
                activityIndicator.startAnimating()
        
        populate()
        viewAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewAnimation(){
        mainCard.addSubview(backView)
        mainCard.addSubview(frontView)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(flip))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.Up
        mainCard.addGestureRecognizer(swipeGesture)
    }
    
    func populate(){
        let url = NSURL(string: "http://luizmai.com.br/desabafo.php")
        typealias JSON = [String:AnyObject]
        var jsonArray: [JSON]!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            do {
                jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? [JSON]
                
                var desabafos = [Desabafo]()
                
                for json in jsonArray {
                    //let id = json["id"] as? Int
                    let titulo = json["titulo"] as? String
                    let conteudo = json["conteudo"] as? String
                    
                    desabafos.append(Desabafo(id: 0, titulo: titulo!,
                        descricao: conteudo!))
                }
            
                self.activityIndicator.removeFromSuperview()
                
                self.listaDesabafos = desabafos
                
                self.update()
                
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
    func update(){
        let random = Int(arc4random_uniform(UInt32(self.listaDesabafos.count)))
        let currentDesabafo = self.listaDesabafos[random]
        self.cardTitleLabel?.text = currentDesabafo.titulo
        self.cardDescriptionLabel?.text = currentDesabafo.descricao
    }
    
    func flip() {
        let toView = showingBack ? frontView : backView
        let fromView = showingBack ? backView : frontView
        
        self.update()
        UIView.transitionFromView(fromView, toView: toView, duration: 1, options: .TransitionCurlUp) {
            (completed) in
        }
        
        showingBack = !showingBack
    }
    
}
