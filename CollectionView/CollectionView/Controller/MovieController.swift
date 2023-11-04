//
//  ViewController.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

final class MovieController: UIViewController {
    
    // MARK: - Properties
    private var movies: [MovieModel]
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MovieCustomCollectionCell.self, forCellWithReuseIdentifier: MovieCustomCollectionCell.cellID)
        collection.backgroundColor = .collectionBackground
        return collection
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        return button
    }() 
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")!
        return imageView
    }()
    
    private let listTitleLabel: UILabel = {
        let label = UILabel()
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
    init(movie: [MovieModel]) {
        self.movies = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        view.backgroundColor = .systemBlue
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    
    
}


// MARK: - Style & Layout extension

extension MovieController {
    
    
    func style() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        listTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainBackground
        
        let barButton = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItem = barButton
        
   
        logoImageView.contentMode = .scaleAspectFill
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
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
            
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            
        ])
        

        
    }
}



// MARK: - collection dataSource

extension MovieController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieCustomCollectionCell.cellID,
            for: indexPath) as? MovieCustomCollectionCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(withMovie: movies[indexPath.row])
        cell.isFavorite = { [weak self] isLiked in
            self?.movies[indexPath.row].isFavorite = isLiked
            self?.collectionView.reloadItems(at: [indexPath])
        }
        return cell
    }
}

// MARK: - collection Delegate

extension MovieController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailsController(movie: movies[indexPath.row])
        show(vc, sender: self)
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



// MARK: - Preview
#Preview {
    UINavigationController(rootViewController: MovieController(movie: MovieModel.initial))
}


