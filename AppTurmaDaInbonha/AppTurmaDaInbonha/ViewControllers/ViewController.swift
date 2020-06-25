//
//  ViewController.swift
//  AppTurmaDaInbonha
//
//  Created by Pedro Henrique Spínola de Assis on 23/06/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

//Tela do Perfil:

class MyCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var imageVideoPerfil: UIImageView!
    
    @IBAction func buttonLocker(_ sender: UIButton) {
    }
}


let reuseIdentifier = "Cell"

class perfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBAction func segmmentedControlPerfil(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        18
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
            cell.imageVideoPerfil.image = UIImage(imageLiteralResourceName: "Captura de Tela 2020-06-22 às 13.50.25")
        cell.imageVideoPerfil.contentMode = .scaleAspectFit
//        cell.buttonLocked.setImage (UIImage (named: "unlock 1")!, for: .normal)
//            cell.buttonLocked.contentMode = .scaleToFill
        
        cell.contentView.frame = cell.bounds
        cell.contentView.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleRightMargin, .flexibleTopMargin, .flexibleHeight, .flexibleBottomMargin]
        
            return cell
    }
    
    
    @IBOutlet weak var collectionViewPerfil_Videos: UICollectionView!
    
    @IBOutlet weak var imagemPerfil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrendondandoBordas()
        // Do any additional setup after loading the view.
    }
    
    
    func arrendondandoBordas(){
        self.imagemPerfil.layer.cornerRadius = 35
    }
    
}
