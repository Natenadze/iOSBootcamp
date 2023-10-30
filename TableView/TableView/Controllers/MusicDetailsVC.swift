//
//  MusicDetailsVC.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

class MusicDetailsVC: UIViewController {
    
    // MARK: - Properties
    private let stackView = UIStackView()
    private let albumImage = UIImageView()
    private let songTitle = UILabel()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init

    init(image: UIImage, song: String) {
        self.albumImage.image = image
        self.songTitle.text = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


// MARK: - Style & Layout

extension MusicDetailsVC {
    
    
    func style() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 32
        
        songTitle.font = .boldSystemFont(ofSize: 20)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(albumImage)
        stackView.addArrangedSubview(songTitle)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            albumImage.heightAnchor.constraint(equalToConstant: 225),
            albumImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
}




