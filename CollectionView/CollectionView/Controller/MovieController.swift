//
//  ViewController.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

class MovieController: UIViewController {
    
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
        view.backgroundColor = .mainBackground
        
    }
    
    func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 16),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
            
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
    MovieController(movie: MovieModel.initial)
}


