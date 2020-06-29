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
    
    @IBOutlet weak var imageEfeitoPerfil: UIImageView!
    
    @IBAction func buttonLocker(_ sender: UIButton) {
        buttonLockerO.isHidden = true
        buttonOpenO.isHidden = false
            }
    
    @IBOutlet weak var labelEfeito: UILabel!
    
    @IBOutlet weak var buttonLockerO: UIButton!

    @IBAction func buttonOpen(_ sender: Any) {
        buttonOpenO.isHidden = true
        buttonLockerO.isHidden = false
    }
    
    @IBOutlet weak var buttonOpenO: UIButton!
    
    @IBOutlet weak var buttonE: UIButton!
    
    @IBAction func buttonEA(_ sender: Any) {
        buttonE.isHidden = true
        buttonEC.isHidden = false
    }
    
    @IBOutlet weak var buttonEC: UIButton!
    
    @IBAction func buttonECA(_ sender: Any) {
        buttonE.isHidden = false
        buttonEC.isHidden = true
    }
    
    
}


let reuseIdentifier = "Cell"

class perfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var countEfeitos: Int = 0
    var countVideos: Int = 0
    
    @IBAction func segmentedControlPerfil(_ sender: UISegmentedControl){
    
    switch sender.selectedSegmentIndex {
        
    case 0:
        
        collectionViewPerfil_Videos.isHidden = false
        collectionViewPerfil_Efeitos.isHidden = true
        buttonMore.isHidden = true
        buttonAddVideo.isHidden = false

        
    default:
        
        collectionViewPerfil_Videos.isHidden = true
        collectionViewPerfil_Efeitos.isHidden = false
        buttonMore.isHidden = false
        buttonAddVideo.isHidden = true

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewPerfil_Videos{
            return countVideos
        }
        else{
            return countEfeitos
        }
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        if collectionView == collectionViewPerfil_Videos{
            cell.imageVideoPerfil.image = UIImage(imageLiteralResourceName: "graceful-ethnic-model-with-white-flower-behind-back-3746156 5")
            cell.imageVideoPerfil.contentMode = .scaleAspectFit
        }
            
        else{
            cell.imageEfeitoPerfil.image = UIImage(imageLiteralResourceName: "Mask Group")
            cell.imageEfeitoPerfil.layer.cornerRadius = 9
            cell.labelEfeito.text = "Efeito " + String(indexPath.row)
        }
        
        cell.contentView.frame = cell.bounds
        cell.contentView.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleRightMargin, .flexibleTopMargin, .flexibleHeight, .flexibleBottomMargin]
        
            return cell
    }
    
    
    @IBOutlet weak var collectionViewPerfil_Videos: UICollectionView!
    
    @IBOutlet weak var collectionViewPerfil_Efeitos: UICollectionView!
    
    @IBOutlet weak var buttonMore: UIButton!
    
    
    @IBAction func buttonMoreA(_ sender: Any) {
        countEfeitos = countEfeitos + 1
        collectionViewPerfil_Efeitos.reloadData()
    }
    
    @IBOutlet weak var buttonAddVideo: UIButton!
    
    @IBAction func buttonAddVideoA(_ sender: Any) {
        countVideos = countVideos + 1
        collectionViewPerfil_Videos.reloadData()
    }
    
    @IBOutlet weak var imagemPerfil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrendondandoBordas()
    }
    
    func arrendondandoBordas(){
        self.imagemPerfil.layer.cornerRadius = 35
    }
    
}
