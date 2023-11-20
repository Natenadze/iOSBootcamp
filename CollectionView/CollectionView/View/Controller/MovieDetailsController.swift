//
//  MovieDetailsController.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

final class MovieDetailsController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: MovieDetailsControllerViewModel
    
    var imageView = UIImageView()
    private let movieTitle = UILabel()
    private let imdbRating = UILabel()
    private let runtime = UILabel()
    private let releaseDate = UILabel()
    private let genre = UILabel()
    private let director = UILabel()
    private let cast = UILabel()
    private let descriptionText = UILabel()

    
    // MARK: - UI Elements
    private let selectSessionButton = UIButton()
    
    private let imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Runtime"
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Release"
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Genre"
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Director"
        return label
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Cast"
        return label
    }()
    
    // MARK: - Stacks
    private let imdbStack = UIStackView()
    private let detailsMainStack = UIStackView()
    private let detailsHorizontalStack = UIStackView()
    private let detailsLeftVerticalStack = UIStackView()
    private let detailsRightVerticalStack = UIStackView()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init
    init(viewModel: MovieDetailsControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

}


// MARK: - Style & Layout

private extension MovieDetailsController {
    
    func style() {
        view.backgroundColor = .mainBackground
        translateAutoResizingConstraints()
        configureStacks()
        configureAndUpdateProperties()
        configureSelectSessionButton()
        configureNavigationBar()
    }
    
    func layout() {
        addSubviews()
        setupConstrains()
    }
}

// MARK: - style methods
extension MovieDetailsController {
    
    private func translateAutoResizingConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        imdbStack.translatesAutoresizingMaskIntoConstraints = false
        detailsMainStack.translatesAutoresizingMaskIntoConstraints = false
        detailsHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        detailsLeftVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        detailsRightVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        selectSessionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureStacks() {
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
    }
    
    private func configureSelectSessionButton() {
        selectSessionButton.setTitle("Select session", for: .normal)
        selectSessionButton.backgroundColor = .orange
        selectSessionButton.setTitleColor(.white, for: .normal)
        selectSessionButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        selectSessionButton.layer.cornerRadius = 12
    }   
    
    private func configureAndUpdateProperties() {
        imageView.contentMode = .scaleAspectFit
        
        imdbRating.textColor = .white
        imdbRating.font = .boldSystemFont(ofSize: 18)
        
        descriptionText.textColor = .white
        descriptionText.numberOfLines = 0
        
        imageView.image = viewModel.getImage()
        
        let movie = viewModel.getMovie()
        movieTitle.text = movie.title
        
        descriptionText.text  = movie.plot
        imdbRating.text = movie.imdbRating
        
        runtime.text = movie.runtime
        runtime.textColor = .white
        
        releaseDate.text = movie.year
        releaseDate.textColor = .white
        
        genre.text = movie.genre
        genre.textColor = .white
        
        director.text = movie.director
        director.textColor = .white
        
        cast.text = movie.actors
        cast.textColor = .white
    }
    
    private func configureNavigationBar() {
        navigationItem.title = movieTitle.text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let backButtonImage = UIImage(systemName: "chevron.left")
        let customBackButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(goBack))
        customBackButton.tintColor = .gray
        navigationItem.leftBarButtonItem = customBackButton
    }
}

// MARK: - layout methods
extension MovieDetailsController {
    
    private func addSubviews() {
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
    }
    
    private func setupConstrains() {
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
