//
//  MusicModel.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

struct Music {
    let title: String
    let image: UIImage
}


// MARK: - extension
extension Music {
    
    static let initial = [
        Music(title: "Seek & Destroy",            image: UIImage(named: "kill")!),
        Music(title: "For Whom the Bell Tolls",   image: UIImage(named: "ride")!),
        Music(title: "Master of Puppets",         image: UIImage(named: "master")!),
        Music(title: "The Frayed Ends of Sanity", image: UIImage(named: "justice")!),
        Music(title: "The God That Failed",       image: UIImage(named: "black")!),
        Music(title: "Until It Sleeps",           image: UIImage(named: "load")!),
        Music(title: "The Memory Remains",        image: UIImage(named: "reload")!),
        Music(title: "Some Kind of Monster",      image: UIImage(named: "anger")!),
        Music(title: "That Was Just Your Life",   image: UIImage(named: "magnetic")!),
        Music(title: "Moth Into Flame",           image: UIImage(named: "hardwired")!),
        Music(title: "If Darkness Had a Son",     image: UIImage(named: "72")!),
    ]
}
