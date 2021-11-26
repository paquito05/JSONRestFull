//
//  ViewControllerEditarUsuario.swift
//  JSONRESTful
//
//  Created by John Samuel Altamirano Sanchez on 11/25/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit

class ViewControllerEditarUsuario: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func btnActulizarUsuario(_ sender: Any) {
        let nombre = txtNombre.text!
        let email = txtEmail.text!
        let clave = txtClave.text!
        let datos = ["nombre": "\(nombre)", "email": "\(email)", "clave":
            "\(clave)"] as Dictionary<String, Any>
        
        let ruta = "http://localhost:3000/usuarios/1"
        metodoPUTUsuario(ruta: ruta, datos: datos)
        navigationController?.popViewController(animated: true)
    }
    
    func metodoPUTUsuario (ruta:String, datos:[String:Any]) {
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
