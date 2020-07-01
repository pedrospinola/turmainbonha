//
//  Cell_Perfil.swift
//  AppTurmaDaInbonha
//
//  Created by Pedro Henrique Spínola de Assis on 01/07/20.
//  Copyright © 2020 Turma Da Inbonha. All rights reserved.
//

import Foundation
import UIKit

public class MyCollectionViewCell: UICollectionViewCell {
    

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

public class VideoPerfil{
    public var preview: UIImage
    public var cadeado: Bool = false
    
    public init (preview: UIImage, cadeado: Bool){
        self.preview = preview
        self.cadeado = cadeado
    }
}


public class EfeitoPerfil{
    public var preview: UIImage
    public var cadeado: Bool = false
    
    public init (preview: UIImage, cadeado: Bool){
        self.preview = preview
        self.cadeado = cadeado
    }
}

