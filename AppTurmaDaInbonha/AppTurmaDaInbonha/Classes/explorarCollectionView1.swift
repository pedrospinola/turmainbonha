//
//  explorarCollectionView1.swift
//  AppTurmaDaInbonha
//
//  Created by Marina Lima on 01/07/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import Foundation
import UIKit

public class explorarCollectionView1: UICollectionViewCell{
    
 
    @IBOutlet weak var myImage1: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    
    
    func displayConten1(image: UIImage, title: String){
               myImage1.image = image
               myLabel1.text = title
           }
       }
