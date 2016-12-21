//
//  Desabafo.swift
//  ADefinir
//
//  Created by Student on 12/20/16.
//  Copyright © 2016 LuizMai & CesarBernabe. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Desabafo {
    var titulo: String?
    var descricao: String?
    var imagem: String?
    var comentarios: [Comentario]?
    var id: Int?
    
    func inserirComentario(comentario: Comentario) {
        self.comentarios?.append(comentario)
    }
    
    init(id: Int, titulo: String, descricao: String){
        self.id = id
        self.titulo = titulo
        self.descricao = descricao
    }
    
    init(titulo: String, descricao: String){
        self.id = 0
        self.titulo = titulo
        self.descricao = descricao
    }
    

}