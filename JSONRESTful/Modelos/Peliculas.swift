//
//  Peliculas.swift
//  JSONRESTful
//
//  Created by John Samuel Altamirano Sanchez on 11/25/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import Foundation
struct Peliculas:Decodable{
    let usuarioId:Int
    let id:Int
    let nombre:String
    let genero:String
    let duracion:String
}
