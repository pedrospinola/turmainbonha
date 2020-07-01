//
//  ViewController.swift
//  AppTurmaDaInbonha
//
//  Created by Pedro Henrique Spínola de Assis on 23/06/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import UIKit


//Tela do Perfil:


class perfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "Cell"
    var countEfeitos: Int = 0
    var countVideos: Int = 0
    var videos: [VideoPerfil] = []
    var efeitos: [EfeitoPerfil] = []

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
            cell.imageVideoPerfil.image = videos[indexPath.row].preview
            cell.imageVideoPerfil.contentMode = .scaleAspectFit
        }
            
        else{
            cell.imageEfeitoPerfil.image = efeitos[indexPath.row].preview
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
    
    var addVideo: [VideoPerfil] = [VideoPerfil(preview: UIImage(imageLiteralResourceName: "graceful-ethnic-model-with-white-flower-behind-back-3746156 5"), cadeado: false)]
    
    var addEfeito: [EfeitoPerfil] = [EfeitoPerfil(preview: UIImage(imageLiteralResourceName: "Mask Group"), cadeado: false)]
    
    
    @IBAction func buttonMoreA(_ sender: Any) {
        countEfeitos = countEfeitos + 1
        efeitos.append(contentsOf: addEfeito)
        collectionViewPerfil_Efeitos.reloadData()
    }
    
    @IBOutlet weak var buttonAddVideo: UIButton!
    
    @IBAction func buttonAddVideoA(_ sender: Any) {
        countVideos = countVideos + 1
        videos.append(contentsOf: addVideo)
        collectionViewPerfil_Videos.reloadData()
    }
    
    @IBOutlet weak var imagemPerfil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagemPerfil.image = UIImage(named: "perfil2.png")
        arrendondandoBordas()
        
        videos = [VideoPerfil(preview: UIImage(imageLiteralResourceName: "graceful-ethnic-model-with-white-flower-behind-back-3746156 5"), cadeado: false)]
        
        efeitos = [EfeitoPerfil(preview: UIImage(imageLiteralResourceName: "Mask Group"), cadeado: false)]
    }
    func arrendondandoBordas(){
        self.imagemPerfil.layer.cornerRadius = 35
    }
}
