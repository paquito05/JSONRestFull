//
//  ViewControllerAgregar.swift
//  JSONRESTful
//
//  Created by John Samuel Altamirano Sanchez on 11/25/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit

class ViewControllerAgregar: UIViewController {

    @IBOutlet weak var botonGuardar: UIButton!
    @IBOutlet weak var botonActulizar: UIButton!
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtGenero: UITextField!
    @IBOutlet weak var txtDuracion: UITextField!
    
    
    @IBAction func btnGuardar(_ sender: Any) {
        let nombre = txtNombre.text!
        let genero = txtGenero.text!
        let duracion = txtDuracion.text!
        let datos = ["usuarioId": 1, "nombre": "\(nombre)", "genero": "\(genero)", "duracion": "\(duracion)"] as Dictionary<String, Any>
        let ruta = "http://localhost:3000/peliculas"
        metodoPOST(ruta: ruta, datos: datos)
        navigationController?.popViewController(animated: true)
    }
    
    var pelicula:Peliculas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pelicula == nil{
            botonGuardar.isEnabled = true
            botonActulizar.isEnabled = false
        }else{
            botonGuardar.isEnabled = false
            botonActulizar.isEnabled = true
            txtNombre.text = pelicula!.nombre
            txtGenero.text = pelicula!.genero
            txtDuracion.text = pelicula!.duracion
        }
    }
    
    

    @IBAction func btnActualizar(_ sender: Any) {
        let nombre = txtNombre.text!
        let genero = txtGenero.text!
        let duracion = txtDuracion.text!
        let datos = ["usuarioId": 1, "nombre": "\(nombre)", "genero": "\(genero)", "duracion":
            "\(duracion)"] as Dictionary<String, Any>
        
        let ruta = "http://localhost:3000/peliculas/\(pelicula!.id)"
        metodoPUT(ruta: ruta, datos: datos)
        navigationController?.popViewController(animated: true)
    }
    
    
    func metodoPOST(ruta:String, datos:[String:Any]) {
           let url : URL = URL(string: ruta)!
           var request = URLRequest(url: url)
           let session = URLSession.shared
           request.httpMethod = "POST"
           // this is your input parameter dictionary
           let params = datos
           
           do{
               request.httpBody = try JSONSerialization.data(withJSONObject: params, options:
                 JSONSerialization.WritingOptions.prettyPrinted)
           }
           catch
           {
            // catch any exception here
           }
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           let task = session.dataTask(with: request, completionHandler:
               {(data, response, error) in
               if (data != nil)
               {
                   do{
                      let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                       print(dict);
                   }
                   catch
                   {
                     // catch any exception here
                   }
               }
           })
           task.resume ()
       }
    
    func metodoPUT (ruta:String, datos:[String:Any]) {
        let url : URL = URL(string: ruta)!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "PUT"
        // this is your input parameter dictionary
        let params = datos
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options:
            JSONSerialization.WritingOptions.prettyPrinted)
        }
        catch{
        // catch any exception here
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask (with: request, completionHandler: {(data, response, error)
            in
            if (data != nil)
            {
                do{
                    let dict = try JSONSerialization.jsonObject(with: data!, options:
                        JSONSerialization.ReadingOptions.mutableLeaves)
                    print(dict);
                }
                catch
                {
                    // catch any exception here
                }
            }
        })
        task.resume ()
    }
    
}
