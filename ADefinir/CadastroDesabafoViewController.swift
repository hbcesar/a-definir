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
    
    // array de "Filme" que utilizaremos nas operações
    //var listaDesabafo: [Desabafo]?

    @IBAction func desabafar(sender: AnyObject) {
        // inicializando o objeto, para que ele seja preparado para receber valores
        self.desabafo = Desabafo()
        self.desabafo?.titulo = self.tituloLabel.text
        self.desabafo?.descricao = self.desabafoLabel.text
        
        // chamada do método de inserir, que está no "M" (model) do MVC
        DesabafoDAO.inserir(self.desabafo!)
    }
}
