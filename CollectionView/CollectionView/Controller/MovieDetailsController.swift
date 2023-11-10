//
//  MovieDetailsController.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

final class MovieDetailsController: UIViewController {
    
    // MARK: - Properties
    private let movieTitle = UILabel()
    var imageView = UIImageView()
    private let imdbRating = UILabel()
    
    private let runtime = UILabel()
    private let releaseDate = UILabel()
    private let genre = UILabel()
    private let director = UILabel()
    private let cast = UILabel  ()
    private let descriptionText = UILabel  ()
    
    private let imdbRatingLabel = UILabel()
    private let runtimeLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let genreLabel = UILabel()
    private let directorLabel = UILabel()
    private let castLabel = UILabel()
    
    // stacks
    private let imdbStack = UIStackView()
    private let detailsMainStack = UIStackView()
    private let detailsHorizontalStack = UIStackView()
    private let detailsLeftVerticalStack = UIStackView()
    private let detailsRightVerticalStack = UIStackView()
    
    let selectSessionButton = UIButton()
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
//    init(movie: MovieModel) {
//        super.init(nibName: nil, bundle: nil)
//        configure(movie)
//    }
    
    
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Methods
    
    func configure(_ movie: MovieModel, image: UIImage?) {
        self.movieTitle.text = movie.title
        self.imageView.image = image
        self.descriptionText.text  = movie.plot
        self.imdbRating.text = movie.imdbRating
        self.runtime.text = movie.runtime
        self.releaseDate.text = movie.year
        self.genre.text = movie.genre
        self.director.text = movie.director
        self.cast.text = movie.actors
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

    
}


// MARK: - Style & Layout

extension MovieDetailsController {
    
    
    func style() {
        view.backgroundColor = .mainBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        imdbStack.translatesAutoresizingMaskIntoConstraints = false
        
        detailsMainStack.translatesAutoresizingMaskIntoConstraints = false
        detailsHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        detailsLeftVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        detailsRightVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        selectSessionButton.translatesAutoresizingMaskIntoConstraints = false
        
        //stacks
        imdbStack.axis = .vertical
        imdbStack.alignment = .center
        
        detailsMainStack.axis = .vertical
        detailsMainStack.alignment = .leading
        detailsMainStack.spacing = 16
        
        detailsHorizontalStack.spacing = 32
        detailsLeftVerticalStack.axis = .vertical
        detailsLeftVerticalStack.spacing = 12
        detailsRightVerticalStack.axis = .vertical
        detailsRightVerticalStack.spacing = 12
        
        imageView.contentMode = .scaleAspectFit
        
        imdbRatingLabel.text = "IMDB"
        imdbRatingLabel.textColor = .gray
        imdbRatingLabel.font = .systemFont(ofSize: 16)
        
        imdbRating.textColor = .white
        imdbRating.font = .boldSystemFont(ofSize: 18)
        
        descriptionText.textColor = .white
        descriptionText.numberOfLines = 0
        

        runtimeLabel.textColor = .gray
        runtimeLabel.text = "Runtime"
        releaseDateLabel.textColor = .gray
        releaseDateLabel.text = "Release"
        genreLabel.textColor = .gray
        genreLabel.text = "Genre"
        directorLabel.textColor = .gray
        directorLabel.text = "Director"
        castLabel.textColor = .gray
        castLabel.text = "Cast"
        
        
        runtime.textColor = .white
        releaseDate.textColor = .white
        genre.textColor = .white
        director.textColor = .white
        cast.textColor = .white
        
        selectSessionButton.setTitle("Select session", for: .normal)
        selectSessionButton.backgroundColor = .orange
        selectSessionButton.setTitleColor(.white, for: .normal)
        selectSessionButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        selectSessionButton.layer.cornerRadius = 12
        
        navigationItem.title = movieTitle.text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let backButtonImage = UIImage(systemName: "chevron.left")
        let customBackButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(goBack))
        customBackButton.tintColor = .gray
        navigationItem.leftBarButtonItem = customBackButton

      

    }
    
    func layout() {
        view.addSubview(imageView)
        imdbStack.addArrangedSubview(imdbRating)
        imdbStack.addArrangedSubview(imdbRatingLabel)
        view.addSubview(imdbStack)
        
        detailsMainStack.addArrangedSubview(descriptionText)

        detailsLeftVerticalStack.addArrangedSubview(runtimeLabel)
        detailsLeftVerticalStack.addArrangedSubview(releaseDateLabel)
        detailsLeftVerticalStack.addArrangedSubview(genreLabel)
        detailsLeftVerticalStack.addArrangedSubview(directorLabel)
        detailsLeftVerticalStack.addArrangedSubview(castLabel)
        detailsHorizontalStack.addArrangedSubview(detailsLeftVerticalStack)
        
        

        detailsRightVerticalStack.addArrangedSubview(runtime)
        detailsRightVerticalStack.addArrangedSubview(releaseDate)
        detailsRightVerticalStack.addArrangedSubview(genre)
        detailsRightVerticalStack.addArrangedSubview(director)
        detailsRightVerticalStack.addArrangedSubview(cast)
        
        detailsHorizontalStack.addArrangedSubview(detailsRightVerticalStack)
        detailsMainStack.addArrangedSubview(detailsHorizontalStack)
        view.addSubview(detailsMainStack)
        view.addSubview(selectSessionButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 260),
            
            imdbStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imdbStack.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
            
            detailsMainStack.topAnchor.constraint(equalToSystemSpacingBelow: imdbStack.bottomAnchor, multiplier: 2),
            detailsMainStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: detailsMainStack.trailingAnchor, multiplier: 2),
            
            selectSessionButton.heightAnchor.constraint(equalToConstant: 60),
            selectSessionButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: selectSessionButton.trailingAnchor, multiplier: 2),
            selectSessionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}


// MARK: - Preview
//#Preview {
//    UINavigationController(rootViewController:
//            MovieDetailsController(movie: MovieModel.initial[0])
//    )
//
//}
//
