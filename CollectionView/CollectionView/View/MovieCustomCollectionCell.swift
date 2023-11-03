//
//  MovieCustomCollectionCell.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

class MovieCustomCollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let cellID = "MovieCustomCollectionCell"
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "heart.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        return button
    }()  
    
    let imdbRating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.font = .boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let titleStackView = UIStackView()
       
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
       
    let genre: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var isLiked: Bool = false {
        didSet {
            heartButton.tintColor = isLiked ? UIColor.red : UIColor.gray
        }
    }
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    func configure(withMovie movie: MovieModel) {
        imageView.image = movie.image
        imdbRating.text = String(movie.imdbRating)
        title.text = movie.title
        genre.text = movie.genre.rawValue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
   
}


extension MovieCustomCollectionCell {
     
    func cellStyle() {
        heartButton.addAction(UIAction(handler: { [weak self] _ in
            self?.isLiked.toggle()
        }), for: .touchUpInside)
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .vertical
        titleStackView.backgroundColor = .collectionBackground
        titleStackView.distribution = .fillProportionally
        
      
    }
    
    func layout() {
        contentView.addSubview(imageView)
        contentView.addSubview(heartButton)
        contentView.addSubview(imdbRating)
        
        titleStackView.addArrangedSubview(title)
        titleStackView.addArrangedSubview(genre)
        contentView.addSubview(titleStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleStackView.topAnchor, constant: 28),
            
            heartButton.widthAnchor.constraint(equalToConstant: 28),
            heartButton.heightAnchor.constraint(equalToConstant: 28),
            heartButton.topAnchor.constraint(equalTo: imageView.topAnchor),
            heartButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            imdbRating.heightAnchor.constraint(equalToConstant: 26),
            imdbRating.widthAnchor.constraint(equalToConstant: 40),
            imdbRating.topAnchor.constraint(equalToSystemSpacingBelow: imageView.topAnchor, multiplier: 1),
            imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: imdbRating.trailingAnchor, multiplier: 1),
            
            
            titleStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
