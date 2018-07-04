//
//  Soundeffect.swift
//  GCSoundboard
//
//  Created by Kieran Foley on 21/06/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import Foundation

class Soundeffect {
    
    let imagePath: String
    let soundPath: String
    let title:String
    
    init(image: String, sound: String, title: String) {
        self.imagePath = image
        self.soundPath = sound
        self.title = title
    }
}
