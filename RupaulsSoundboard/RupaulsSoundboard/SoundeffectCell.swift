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
    static let CELL_ID: String = "soundEffectCell"
    
    var imageView: UIImageView = UIImageView()
    
    var soundeffect: Soundeffect?

    var titleLabel:UILabel = UILabel()
    
    
    // Assigns specific / unique image and sound to each cell
    func setup(_ soundeffect: Soundeffect) -> Void {
        self.soundeffect = soundeffect

        // Cell images
        self.imageView.image = UIImage(named: soundeffect.imagePath)!
        self.imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        
        
        self.titleLabel.text = soundeffect.title
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.getSilver()
        self.titleLabel.font = UIFont(name: "Effra", size: 12)
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.titleLabel.transform = CGAffineTransform(rotationAngle: -0.175)
        self.titleLabel.numberOfLines = 3
        
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        self.bringSubview(toFront: titleLabel)
    }
    
    // Cell pressed
    @objc func tap(sender: UITapGestureRecognizer){
        // Animates cell
        self.spin()
//        AudioManager.singleton.playSound(name: (soundeffect?.soundPath)!)
    }
}
