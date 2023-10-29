//
//  MusicCell.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit


class MusicCell: UITableViewCell {
    
    // MARK: - Properties
    let musicImageView = UIImageView()
    let titleLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(with music: Music) {
        musicImageView.image = music.image
        titleLabel.text = music.title
    }
}


extension MusicCell {
    
    func cellStyle() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        
        musicImageView.contentMode = .scaleAspectFit
        musicImageView.clipsToBounds = true
    }
    
    func layout() {
        
        contentView.addSubview(musicImageView)
        contentView.addSubview(titleLabel)
        
        // MARK: -
        NSLayoutConstraint.activate([
            musicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            musicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            musicImageView.widthAnchor.constraint(equalTo: musicImageView.heightAnchor, multiplier: 0.75),
            musicImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
