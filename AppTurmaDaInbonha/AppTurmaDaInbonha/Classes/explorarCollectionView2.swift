//
//  explorarCollectionView2.swift
//  AppTurmaDaInbonha
//
//  Created by Marina Lima on 01/07/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import Foundation
import UIKit

public class explorarCollectionView2: UICollectionViewCell{
    
    
    @IBOutlet weak var myImage2: UIImageView!
    @IBOutlet weak var myLabel2: UILabel!
    
    func displayConten2(image: UIImage, title: String){
        myImage2.image = image
        myLabel2.text = title
    }
}
