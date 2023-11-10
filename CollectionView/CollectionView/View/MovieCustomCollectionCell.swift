//
//  MovieCustomCollectionCell.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

final class MovieCustomCollectionCell: UICollectionViewCell {
    
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
    
    
    private let imdbRating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.font = .boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let titleStackView = UIStackView()
       
    private let title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
       
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private var isLiked: Bool = false
    
    
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
        imdbRating.text = movie.imdbRating
        title.text = movie.title
        genreLabel.text = movie.genre
        updateMovieImage(imageURL: movie.poster)
    }
    
    
    func updateMovieImage(imageURL: String)  {
        Task {
            if let imageData: Data = try? await NetworkManager.performURLRequest(imageURL, isPoster: true){
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
                
            }
        }
       
    }
  
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
   
}


extension MovieCustomCollectionCell {
     
    func cellStyle() {
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .vertical
        titleStackView.backgroundColor = .collectionBackground
        titleStackView.distribution = .fillProportionally
        
      
    }
    
    func layout() {
        contentView.addSubview(imageView)
        contentView.addSubview(imdbRating)
        
        titleStackView.addArrangedSubview(title)
        titleStackView.addArrangedSubview(genreLabel)
        contentView.addSubview(titleStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleStackView.topAnchor, constant: 28),

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
