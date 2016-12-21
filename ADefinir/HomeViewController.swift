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
    
    private var showingBack = false
    
    var listaDesabafos = [Desabafo]()
    
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
        
        // Do any additional setup after loading the view.
        //let desabafo = listaDesabafos[0]
        let desabafo = createDesabafoTeste()
        
        cardTitleLabel.text = desabafo.titulo
        cardDescriptionLabel.text = desabafo.descricao
        
        viewAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDesabafoTeste() -> Desabafo {
        let desabafo = Desabafo()
        desabafo.titulo = "Eu queria ser rolezeira"
        desabafo.descricao = "Oi eu queria ser rolezeira pra fecha com os boy mas minha mãe não deixa"
        
        return desabafo
    }
    
    func viewAnimation(){
        mainCard.addSubview(backView)
        mainCard.addSubview(frontView)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(flip))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.Up
        mainCard.addGestureRecognizer(swipeGesture)
    }
    
    func flip() {
        let toView = showingBack ? frontView : backView
        let fromView = showingBack ? backView : frontView
        UIView.transitionFromView(fromView, toView: toView, duration: 1, options: .TransitionCurlUp, completion: nil)
        
        //Mudar contents da view
        let url = NSURL(string: "http://luizmai.com.br/desabafo.php")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
        
        showingBack = !showingBack
    }
    
}
