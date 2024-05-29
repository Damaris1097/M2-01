//
//  ViewController.swift
//  UnixTime
//
//  Created by Facultad de Contaduría y Administración on 29/05/24.
//

import UIKit

class ViewController: UIViewController {

    let downloader = DataDownloader()
    
    @IBOutlet weak var labelFecha: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getFecha(_ sender: Any) {
        
        downloader.getTime { [weak self] tiempo in
            DispatchQueue.main.async {
                self?.labelFecha.text = tiempo.datetime
                
                let alert = UIAlertController()
                alert.title = "Error"
                alert.message = "La fecha del sistema no corresponde con la fecha actual"
                self?.present(alert, animated: true)
            }
        }
    }
}

