//
//  CollectionViewCell.swift
//  GCSoundboard
//
//  Created by Kieran Foley on 20/06/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit

class SoundeffectCell: UICollectionViewCell {
    
    // RE-USE Identifier
    static let CELL_ID: String = "soundeffectCell"
    
    var imageView: UIImageView = UIImageView()
    
    var soundeffect: Soundeffect?

    // Assigns specific / unique image and sound to each cell
    func setup(_ soundeffect: Soundeffect) -> Void {
        self.soundeffect = soundeffect

        // Cell images
        self.imageView.image = UIImage(named: soundeffect.imagePath)!
        self.imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(imageView)
    }
    
    // Cell pressed
    @objc func tap(sender: UITapGestureRecognizer){
        // Animates cell
        self.spin()
        AudioManager.singleton.playSound(name: (soundeffect?.soundPath)!)
    }
}
