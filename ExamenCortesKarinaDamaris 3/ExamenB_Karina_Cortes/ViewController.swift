//
//  ViewController.swift
//  ExamenB_Karina_Cortes
//
//  Created by Damaris Cortés on 08/06/24.
//

import UIKit
import Foundation


    
public  var resultado = 0.0
public var raiz = 0.0

public var array : [String] = [""]



class ViewController: UIViewController {
    
    @IBOutlet weak var numer: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
    }
    
    
    @IBAction func generar(_ sender: UIButton)  {
        
            if var numero = Double(numer.text!){
                
                if tieneRaizCuadradaExacta(numero: numero) {
                    
                     array = generateArray(from: 1, to: Int(numero))
                    
                    resultado = numero
                    raiz = sqrt(numero)
                    print("la raiz  es : \(resultado)")
                   print(array)
                    
                    
                } else {
                    
                    while !tieneRaizCuadradaExacta(numero: numero) {
                        numero -= 1
                        
                    }
                    
                     array = generateArray(from: 1, to: Int(numero))
                    resultado = numero
                    
                    raiz = sqrt(numero)
                    print("la raiz  es : \(resultado)")
                
                   
                    print(array)
                    
                }
                
            }
            
        
        performSegue(withIdentifier: "mostrar", sender: nil)
        
    }
    
    
    
    //Funcion para saber si tiene raíz cuadrada exacta
    
    func tieneRaizCuadradaExacta( numero: Double) -> Bool {
        
        let raizCuadrada = sqrt(Double(numero))
        
        return raizCuadrada.truncatingRemainder(dividingBy: 1) == 0
    }
    
    func generateArray(from: Int, to: Int) -> [String] {
        return (from...to).map { String($0) }
    }
    
    
    
}

