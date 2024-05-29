//
//  ViewController.swift
//  UNix
//
//  Created by Macbook Air 5 on 29/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelfecha: UILabel!
    
    let downloader = DataDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getFecha(_ sender: Any) {
        
        downloader.getTime{[weak self] tiempo in
            DispatchQueue.main.async{
                self?.labelfecha.text = tiempo.datetime
                
                
                //if fecha != server fecha
                let currentDate = Date()
                if Date().timeIntervalSince1970 != currentDate{
                    
                    
                    let alert = UIAlertController()
                    alert.title="ERROR DE FECHA"
                    alert.message="La fecha del sistema no corresponde con la fecha actual"
                    self?.present(alert,animated: true)
                }
            }
        }
    }
}

