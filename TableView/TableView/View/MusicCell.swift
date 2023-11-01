//
//  MusicCell.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit


final class MusicCell: UITableViewCell {
    
    // MARK: - Properties
    private let musicImageView = UIImageView()
    private let titleLabel = UILabel()
    
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

// MARK: - extension

extension MusicCell {
    
    private func cellStyle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        
        musicImageView.contentMode = .scaleAspectFit
        musicImageView.clipsToBounds = true
    }
    
    private func layout() {
        
        contentView.addSubview(musicImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            musicImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            musicImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            musicImageView.heightAnchor.constraint(equalToConstant: 60),
            musicImageView.widthAnchor.constraint(equalTo: musicImageView.heightAnchor, multiplier: 0.75),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}
