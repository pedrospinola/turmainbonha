//
//  ViewController.swift
//  AppTurmaDaInbonha
//
//  Created by Pedro Henrique Spínola de Assis on 23/06/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import UIKit

//Tela Explorar

class explorarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstCollection: UICollectionView!
    @IBOutlet weak var secondCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    var items = ["  Neon 1", "  Neon 2", "  Neon 3", "  Neon 4"]
    var effectImages: [UIImage] = [
         UIImage(named: "tyler-lastovich-3shfnfzdFVc-unsplash")!,
         UIImage(named: "h-heyerlein-ndja2LJ4IcM-unsplash")!,
         UIImage(named:"drew-beamer-3SIXZisims4-unsplash")!,
         UIImage(named:"jiroe-b9kh72kOcdM-unsplash")!
     ]
    
    var items2 = ["  Old School", "  Too Busy", "  Ocean", "  Glow!"]
    var effectImages2: [UIImage] = [
        UIImage(named: "joshua-newton-7qjqQjt7zXQ-unsplash")!,
        UIImage(named: "monil-andharia-0xVrOF1oaPU-unsplash")!,
        UIImage(named: "tim-zankert-82xVrlfYs1w-unsplash")!,
        UIImage(named: "zbynek-burival-2tX5Wgh5XIA-unsplash")!]
    
    let reuseIdentifier = "cell"
    
    let secondIdentifier = "secondCell"
    // also enter this string as the cell identifier in the storyboard
    
    
    var filteredData: [String]!
    var filteredImage: [UIImage]!
    var filteredData2: [String]!
    var filteredImage2: [UIImage]!

    
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.firstCollection {
            return filteredData.count
        }

        return filteredData2.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == self.firstCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! explorarCollectionView1
                // Set up cell
       cell.displayConten1(image: filteredImage[indexPath.item], title: filteredData[indexPath.item])
       cell.layer.cornerRadius = 8

       return cell
            }
    

        else {
        let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as! explorarCollectionView2
       secondCell.displayConten2(image: filteredImage2[indexPath.item], title: filteredData2[indexPath.item])
       secondCell.layer.cornerRadius = 8

       return secondCell
            }
}

    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    
    // MARK: - UISearchBarDelegate protocol
    
     //This method updates filteredData based on the text in the Search Box
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        filteredData = searchText.isEmpty ? items : items.filter { (item: String) -> Bool in
//            // If dataItem matches the searchText, return true to include it
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
//
//        firstCollection.reloadData()
//    }
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
        
        firstCollection.dataSource = self
        firstCollection.delegate = self
        secondCollection.dataSource = self
        secondCollection.delegate = self
        //searcBar.delegate = self
        filteredData = items
        filteredImage = effectImages
        filteredData2 = items2
        filteredImage2 = effectImages2
        scrollView.contentSize = CGSize(width: 331, height: 1300)
    }
}



      // MARK: - Tela do Perfil

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
