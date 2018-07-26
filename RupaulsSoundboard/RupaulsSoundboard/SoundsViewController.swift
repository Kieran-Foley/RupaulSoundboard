//
//  ViewController.swift
//  RupaulsSoundboard
//
//  Created by Kieran Foley on 01/07/2018.
//  Copyright © 2018 Kieran Foley. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SoundsViewController: UIViewController, GADBannerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // Actual Key = ca-app-pub-1725298510457190/1645558705
    private static let AD_UNIT_ID: String = "ca-app-pub-3940256099942544/2934735716"
    
    private static let SOUNDEFFECTS: [Soundeffect] = [
        Soundeffect.init(image: "cellRound.png", sound: "backrolls", title: "Back Rolls?"),
        Soundeffect.init(image: "cellRound.png", sound: "PartyCity", title: "Party City"),
        Soundeffect.init(image: "cellRound.png", sound: "showGirl", title: "Show Girl"),
        Soundeffect.init(image: "cellRound.png", sound: "whenImGoodImGood", title: "I'm\nGood"),
        
        Soundeffect.init(image: "cellRound.png", sound: "Anus", title: "Anus"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test"),
//        Soundeffect.init(image: "cellRound.png", sound: "", title: "Test")
    ]
    
    
    private static let CELLS_PER_ROW: CGFloat = 4
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    // Stops all sound from audio player
    @IBOutlet weak var stopSoundButton: UIButton!
    
    // Plays a random sound from SOUNDEFFECTS
    @IBOutlet weak var randomButton: UIButton!
    
    fileprivate var bannerView: GADBannerView!

    var cellSpacing: CGFloat?
    var cellDimensions: CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        
        // adMob
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        addBannerViewToView(bannerView)
        bannerView.adUnitID = SoundsViewController.AD_UNIT_ID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
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
    

    // Set adMob banners constraints to safe area
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        bannerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
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
                stopSoundButton.widthAnchor.constraint(equalToConstant: cellDimensions!*2).isActive = true
                stopSoundButton.heightAnchor.constraint(equalToConstant: cellDimensions!).isActive = true
                randomButton.widthAnchor.constraint(equalToConstant: cellDimensions!*2).isActive = true
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
    
    @IBAction func stopSoundPushed(_ sender: UIButton) {
        sender.pulse()
        AudioManager.singleton.stopAll()
    }
    
    @IBAction func randomSoundPushed(_ sender: UIButton) {
        sender.pulse()
        
        // Gets the amount of sounds in instance
        let count = UInt32(SoundsViewController.SOUNDEFFECTS.count)
        // Gets a random number between 0 and count
        let randomNum:Int = Int(arc4random_uniform(count))
        let sound = SoundsViewController.SOUNDEFFECTS[randomNum]
        print(randomNum)
        AudioManager.singleton.randomNo(sounds: [sound.soundPath])
    }
    
    
}


