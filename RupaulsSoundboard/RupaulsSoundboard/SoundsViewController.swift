//
//  ViewController.swift
//  RupaulsSoundboard
//
//  Created by Kieran Foley on 01/07/2018.
//  Copyright © 2018 Kieran Foley. All rights reserved.
//

import UIKit

class SoundsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()

    
    }
    
    func setupBackground() {
        let gradient = CAGradientLayer()
        
        // Create a gradient at 3/4 down the view
        gradient.locations = [0.75, 1]
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }
    
    // Assign image / sound to each cell and add a gesture recogniser to animate / play sound
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        return cell
    }
    
    
    
    
}

