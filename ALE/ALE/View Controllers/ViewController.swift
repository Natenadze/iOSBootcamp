//
//  ViewController.swift
//  ALE
//
//  Created by Davit Natenadze on 25.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    private let product: Coffee
    
    // model properties
    private let titleLabel          = UILabel()
    private let subTitleLabel       = UILabel()
    private let descriptionLabel    = UILabel()
    private let ratingLabel         = UILabel()
    private let ratingQuantityLabel = UILabel()
    private let priceLabel          = UILabel()
    
    // buttons
    private let backButton  = UIButton()
    private let heartButton = UIButton()
    private let mugButton   = UIButton()
    private let dropButton  = UIButton()
    private let sSizeButton = UIButton()
    private let mSizeButton = UIButton()
    private let lSizeButton = UIButton()
    private let buyButton   = UIButton()
    
    // labels
    private let detailLabel      = UILabel()
    private let descriptionTitle = UILabel()
    private let sizeTitle        = UILabel()
    private let priceTitle       = UILabel()
    private let bottomPriceLabel = UILabel()
    
    
    // View
    private let imageView = UIImageView(image: UIImage(named: "cappuccino"))
    private let ratingStarIcon = UIImageView()
    private let divider = UIView()
    
    // stacks
    private let navBarStack      = UIStackView()
    private let titleStack       = UIStackView()
    private let ratingStack      = UIStackView()
    private let middleRightStack = UIStackView()
    private let descriptionStack = UIStackView()
    private let sizeStack        = UIStackView()
    private let sizeButtonStack  = UIStackView()
    private let bottomMainStack  = UIStackView()
    private let bottomVerticalStack = UIStackView()
    
    
    
    // MARK: - life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init
    init(product: Coffee) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - Style & Layout

extension ViewController {
    
    private func style() {
        translateMaskIntoConstraints()
        topPartStyleConfig()
        middlePartStyleConfig()
        bottomPartStyleConfig()
    }
    
    private func layout() {
        addSubviews()
        activateTopPartConstraints()
        activateBottomPartConstraints()
    }
}

// MARK: - Helper Functions

extension ViewController {
    
    private func translateMaskIntoConstraints() {
        navBarStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        ratingStack.translatesAutoresizingMaskIntoConstraints = false
        descriptionStack.translatesAutoresizingMaskIntoConstraints = false
        sizeStack.translatesAutoresizingMaskIntoConstraints = false
        sizeButtonStack.translatesAutoresizingMaskIntoConstraints = false
        bottomMainStack.translatesAutoresizingMaskIntoConstraints = false
        bottomVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        middleRightStack.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingStarIcon.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func topPartStyleConfig() {
        navBarStack.distribution = .equalSpacing
        
        // backButton
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        
        // detailLabel
        detailLabel.text = "Detail"
        detailLabel.textAlignment = .center
        detailLabel.font = .boldSystemFont(ofSize: 18)
        
        // heartView
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .black
        
        // imageView
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
    }
    
    private func middlePartStyleConfig() {
        // titleStack
        titleStack.axis = .vertical
        titleStack.spacing = 8
        
        // description Stack
        descriptionStack.axis = .vertical
        
        // size Stack
        sizeStack.axis = .vertical
        sizeStack.spacing = 8
        
        // icon buttons
        mugButton.createIconButton(systemImageName: "mug.fill")
        dropButton.createIconButton(systemImageName: "drop.fill")
        
        // sizeButton Stack
        sizeButtonStack.distribution = .fillEqually
        sizeButtonStack.spacing = 8
        
        middleRightStack.spacing = 12
        
        // ratingStack
        ratingStack.alignment = .bottom
        
        // bottomMain Stack
        bottomVerticalStack.axis = .vertical
        bottomVerticalStack.distribution = .fillProportionally
        bottomVerticalStack.spacing = -18
        
        // titleLabel
        titleLabel.text = product.title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        // subTitleLabel
        subTitleLabel.text = product.subTitle
        subTitleLabel.font = .systemFont(ofSize: 12)
        subTitleLabel.textColor = .systemGray2
        
        // descriptionTitle
        descriptionTitle.text = "Description"
        descriptionTitle.font = .boldSystemFont(ofSize: 16)
        
        // description Label
        descriptionLabel.text = product.description
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray2
        descriptionLabel.numberOfLines = 3
        
        // Rating Star
        ratingStarIcon.image = UIImage(systemName: "star.fill")
        ratingStarIcon.tintColor = .orange
        
        // ratingLabel Label
        ratingLabel.text = String(product.rating)
        ratingLabel.font = .boldSystemFont(ofSize: 16)
        
        // ratingQuantityLabel Label
        ratingQuantityLabel.text = String("(\(product.ratingQuantity))")
        ratingQuantityLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        // divider
        divider.backgroundColor = .gray
    }
    
    private func bottomPartStyleConfig() {
        
        // size Title
        sizeTitle.text = "Size"
        sizeTitle.font = .boldSystemFont(ofSize: 16)
        
        // size Buttons
        sSizeButton.createSizeButton(buttonName: CoffeeSize.small.rawValue)
        mSizeButton.createSizeButton(buttonName: CoffeeSize.medium.rawValue)
        lSizeButton.createSizeButton(buttonName: CoffeeSize.large.rawValue)
        
        //
        priceTitle.text = "Price"
        priceTitle.font = .systemFont(ofSize: 12)
        priceTitle.textColor = .gray
        
        // priceLabel Label
        priceLabel.text = String("$ \(product.price)")
        priceLabel.font = .boldSystemFont(ofSize: 18)
        priceLabel.textColor = .orange
        
        //
        buyButton.setTitle("Buy Now", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .orange
        buyButton.layer.cornerRadius = 16
    }
}

// MARK: - Layout extension

extension ViewController {
    
    private func addSubviews() {
        navBarStack.addArrangedSubview(backButton)
        navBarStack.addArrangedSubview(detailLabel)
        navBarStack.addArrangedSubview(heartButton)
        view.addSubview(navBarStack)
        //
        view.addSubview(imageView)
        //
        titleStack.addArrangedSubview(titleLabel)
        titleStack.addArrangedSubview(subTitleLabel)
        view.addSubview(titleStack)
        //
        view.addSubview(ratingStarIcon)
        //
        ratingStack.addArrangedSubview(ratingLabel)
        ratingStack.addArrangedSubview(ratingQuantityLabel)
        view.addSubview(ratingStack)
        //
        middleRightStack.addArrangedSubview(mugButton)
        middleRightStack.addArrangedSubview(dropButton)
        view.addSubview(middleRightStack)
        
        // MARK: - Middle
        
        descriptionStack.addArrangedSubview(descriptionTitle)
        descriptionStack.addArrangedSubview(descriptionLabel)
        view.addSubview(descriptionStack)
        //
        sizeStack.addArrangedSubview(sizeTitle)
        sizeStack.addArrangedSubview(sizeButtonStack)
        sizeButtonStack.addArrangedSubview(sSizeButton)
        sizeButtonStack.addArrangedSubview(mSizeButton)
        sizeButtonStack.addArrangedSubview(lSizeButton)
        view.addSubview(sizeStack)
        
        view.addSubview(divider)
        
        // MARK: - Bottom
        
        bottomVerticalStack.addArrangedSubview(priceTitle)
        bottomVerticalStack.addArrangedSubview(priceLabel)
        bottomMainStack.addArrangedSubview(bottomVerticalStack)
        bottomMainStack.addArrangedSubview(buyButton)
        view.addSubview(bottomMainStack)
    }
    
    private func activateTopPartConstraints() {
        NSLayoutConstraint.activate([
            // navBar
            
            navBarStack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            navBarStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: navBarStack.trailingAnchor, multiplier: 4),
            
            // backButton
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 12),
            
            // imageView
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: navBarStack.bottomAnchor, multiplier: 3),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.278),
            
            // titleStack
            titleStack.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 3),
            titleStack.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            //rating Star Icon
            ratingStarIcon.topAnchor.constraint(equalToSystemSpacingBelow: titleStack.bottomAnchor, multiplier: 1.6),
            ratingStarIcon.leadingAnchor.constraint(equalTo: titleStack.leadingAnchor),
            
            // ratingStack
            ratingStack.topAnchor.constraint(equalTo: ratingStarIcon.topAnchor),
            ratingStack.leadingAnchor.constraint(equalTo: ratingStarIcon.trailingAnchor, constant: 4),
            //
            middleRightStack.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            middleRightStack.bottomAnchor.constraint(equalTo: ratingStack.bottomAnchor),
        ])
    }
    
    private func activateBottomPartConstraints() {
        NSLayoutConstraint.activate([
            // divider
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: ratingStack.bottomAnchor, multiplier: 3),
            divider.leadingAnchor.constraint(equalTo: ratingStarIcon.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            // description
            descriptionStack.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 3),
            descriptionStack.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
            descriptionStack.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            
            // size
            sizeStack.topAnchor.constraint(equalToSystemSpacingBelow: descriptionStack.bottomAnchor, multiplier: 3),
            sizeStack.leadingAnchor.constraint(equalTo: descriptionStack.leadingAnchor),
            sizeStack.trailingAnchor.constraint(equalTo: descriptionStack.trailingAnchor),
            
            
            // buyButton
            buyButton.widthAnchor.constraint(equalToConstant: 217),
            buyButton.heightAnchor.constraint(equalToConstant: 62),
            
            bottomMainStack.topAnchor.constraint(equalToSystemSpacingBelow: sizeButtonStack.bottomAnchor, multiplier: 2),
            bottomMainStack.leadingAnchor.constraint(equalTo: sizeButtonStack.leadingAnchor),
            bottomMainStack.trailingAnchor.constraint(equalTo: sizeButtonStack.trailingAnchor),
        ])
    }
}



// MARK: - Preview

#Preview {
    ViewController(product: Coffee.initial)
}



