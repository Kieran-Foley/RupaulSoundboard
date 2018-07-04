//
//  ViewController.swift
//  RupaulsSoundboard
//
//  Created by Kieran Foley on 01/07/2018.
//  Copyright © 2018 Kieran Foley. All rights reserved.
//

import UIKit

class SoundsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private static let SOUNDEFFECTS: [Soundeffect] = [
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test"),
        Soundeffect.init(image: "cell.png", sound: "", title: "Test")
    ]
    
    
    private static let CELLS_PER_ROW: CGFloat = 4
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    // Stops all sound from audio player
    @IBOutlet weak var stopSoundButton: UIButton!
    
    // Plays a random sound from SOUNDEFFECTS
    @IBOutlet weak var randomButton: UIButton!
    
    
    
    var cellSpacing: CGFloat?
    var cellDimensions: CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Stops the default animation of UIButton when user interacts (Grey highlight)
        self.stopSoundButton.adjustsImageWhenHighlighted = false
        self.randomButton.adjustsImageWhenHighlighted = false
    
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
        
        // Setup the cell dimensions and spacing ONCE
        if cellSpacing == nil && cellDimensions == nil {
            if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                cellSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
                cellDimensions = (collectionView.frame.width - max(0, SoundsViewController.CELLS_PER_ROW - 1) * cellSpacing!) / SoundsViewController.CELLS_PER_ROW
                
                flowLayout.itemSize = CGSize(width: cellDimensions!, height: cellDimensions!)
                
                // Button spacing in stack view == Cell spacing
                stackView.spacing = cellSpacing!
                
                // Cell constaints
                stopSoundButton.widthAnchor.constraint(equalToConstant: cellDimensions!).isActive = true
                stopSoundButton.heightAnchor.constraint(equalToConstant: cellDimensions!).isActive = true
                randomButton.widthAnchor.constraint(equalToConstant: cellDimensions!).isActive = true
                randomButton.heightAnchor.constraint(equalToConstant: cellDimensions!).isActive = true
            }
        }
        // Return the amount of cells == sounds
        return SoundsViewController.SOUNDEFFECTS.count
    }
    
    // Assign image / sound to each cell and add a gesture recogniser to animate / play sound
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SoundeffectCell.CELL_ID, for: indexPath) as! SoundeffectCell
        cell.setup(SoundsViewController.SOUNDEFFECTS[indexPath.row])
        cell.addGestureRecognizer(UITapGestureRecognizer(target: cell, action: #selector(SoundeffectCell.tap)))
        return cell
    }
    
    
    
    
}

