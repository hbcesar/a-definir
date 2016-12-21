//
//  CadastroDesabafoViewController.swift
//  ADefinir
//
//  Created by Student on 12/20/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import UIKit

class CadastroDesabafoViewController: UIViewController {
    @IBOutlet weak var tituloLabel: UITextField!
    @IBOutlet weak var desabafoLabel: UITextView!
    
    
    // objeto "Filme" que manipularemos nas operações
    var desabafo: Desabafo?
    
    @IBAction func criarDesabafo(sender: UIButton!) {
        self.desabafo = Desabafo(titulo: self.tituloLabel.text!, descricao: self.desabafoLabel.text)
//        self.desabafo?.titulo = self.tituloLabel.text
//        self.desabafo?.descricao = self.desabafoLabel.text
        
        // chamada do método de inserir, que está no "M" (model) do MVC
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://luizmai.com.br/desabafo.php")!)
        request.HTTPMethod = "POST"
        let postString = "titulo=" + (self.desabafo?.titulo)! +
            "&conteudo="+(self.desabafo?.descricao)!
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
        }
        task.resume()

    }
    // array de "Filme" que utilizaremos nas operações
    //var listaDesabafo: [Desabafo]?

}
