//
//  ViewController.swift
//  persistencia
//
//  Created by Macbook Air 5 on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var miTexto: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        miTexto.text = userDefaults.string(forKey: "Llave")
    }

    @IBAction func texto(_ sender: Any) {
        print(miTexto.text)
        userDefaults.set(miTexto.text, forKey: "Llave")
    }
    
}

