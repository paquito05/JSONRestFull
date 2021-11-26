//
//  File.swift
//  JSONRESTful
//
//  Created by John Samuel Altamirano Sanchez on 11/25/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import Foundation

struct Users:Decodable{
    let id:Int
    let nombre:String
    let clave:String
    let email:String
}
