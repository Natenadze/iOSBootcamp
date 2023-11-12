//
//  ViewController.swift
//  Animations
//
//  Created by Davit Natenadze on 12.11.23.
//


import UIKit

final class ViewController: UIViewController {

    // MARK: - UI Elements
    private let tbcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TBC IT Academy"
        label.textColor = .systemBlue
        label.alpha = 0
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Animation", for: .normal)
        button.configuration = .filled()
        button.layer.cornerRadius = 16
        return button
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    




    
}



// MARK: - style & Layout
extension ViewController {

    private func style() {

        startButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self else { return }
//            AnimationManager.startSlideAnimation(for: tbcLabel)
            AnimationManager.rotateLabel(label: tbcLabel, view: view)

            
        }), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(tbcLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            tbcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbcLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
}



