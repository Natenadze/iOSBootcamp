//
//  ViewController.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

final class MovieController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: MovieControllerViewModel
    
    
    // MARK: - UI Elements
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MovieCustomCollectionCell.self, forCellWithReuseIdentifier: MovieCustomCollectionCell.cellID)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .collectionBackground
        return collection
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")!
        return imageView
    }()
    
    private let listTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Now in cinemas"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
    // MARK: - init
    
    init(viewModel: MovieControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - extensions

extension MovieController {
    
    // MARK: - helper Methods
    private func setup()  {
        view.backgroundColor = .systemBlue
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupNavigationBar() {
        let barButton = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItem = barButton
        
        logoImageView.contentMode = .scaleAspectFill
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }
}


// MARK: - Style & Layout extension

extension MovieController {
    
    
    func style() {
        
        view.backgroundColor = .mainBackground
        setupNavigationBar()
    }
    
    func layout() {
        view.addSubview(profileButton)
        view.addSubview(collectionView)
        view.addSubview(listTitleLabel)
        
        NSLayoutConstraint.activate([
            listTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            listTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: listTitleLabel.bottomAnchor, multiplier: 2),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 16),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            profileButton.widthAnchor.constraint(equalToConstant: 80),
            profileButton.heightAnchor.constraint(equalToConstant: 40),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            
        ])
    }
}



// MARK: - collection dataSource

extension MovieController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieCustomCollectionCell.cellID,
            for: indexPath) as? MovieCustomCollectionCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(withMovie: viewModel.movies[indexPath.row])
        return cell
    }
}

// MARK: - collection Delegate

extension MovieController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedMovie = viewModel.movies[indexPath.row]
        let selectedCell = collectionView.cellForItem(at: indexPath) as? MovieCustomCollectionCell
        let viewModel = MovieDetailsControllerViewModel(
            movie: selectedMovie,
            image: selectedCell?.imageView.image
        )
        let detailsViewController = MovieDetailsController(viewModel: viewModel)
        show(detailsViewController, sender: self)
    }
    
    
}

extension MovieController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width / 2) - 32
        return CGSize(width: width, height: 278)
    }
    
    //vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
    
}

