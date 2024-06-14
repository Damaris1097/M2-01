//
//  viewController2.swift
//  ExamenB_Karina_Cortes
//
//  Created by Damaris Cortés on 08/06/24.
//


import UIKit


class ViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var reuseIdentifier = "miCelda"

    var items = array
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let width = (Int(view.frame.size.width)-20) / Int(sqrt(resultado))
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        return self.items.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MiCollectionViewCell
        cell.titulo.text = self.items[indexPath.row]
        cell.backgroundColor = UIColor.cyan
      
        return cell
        
        
        
        
        
    }

    }



