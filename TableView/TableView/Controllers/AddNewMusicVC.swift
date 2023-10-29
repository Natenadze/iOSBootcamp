//
//  AddNewMusicVC.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

protocol AddNewMusicDelegate: AnyObject {
    func addMusic(music: Music)
}

class AddNewMusicVC: UIViewController {
    
    // MARK: - Properties
    private let imageView = UIImageView()
    private let imageSelectionButton = UIButton()
    private let imageTitleTextField = UITextField()
    
    private let imagePicker = UIImagePickerController()
    
    
    weak var delegate: AddNewMusicDelegate?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - Methods
    @objc func openPhotoLibrary() {
        
        present(imagePicker, animated: true)
    }
    
    
}


// MARK: - Style & Layout

extension AddNewMusicVC {
    
    
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        imageTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        imageTitleTextField.placeholder = "Type Song name"
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        imageView.image = UIImage(systemName: "photo.on.rectangle")
        
        imageSelectionButton.setTitle("Pick image", for: .normal)
        imageSelectionButton.backgroundColor = .systemBlue
        imageSelectionButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
        
    }
    
    func layout() {
        view.addSubview(imageView)
        view.addSubview(imageTitleTextField)
        view.addSubview(imageSelectionButton)

        
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: imageTitleTextField.bottomAnchor, multiplier: 3),
            imageTitleTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: imageTitleTextField.trailingAnchor, multiplier: 4),
            
            imageView.heightAnchor.constraint(equalToConstant: 225),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageSelectionButton.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 6),
            imageSelectionButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: imageSelectionButton.trailingAnchor, multiplier: 4),
            imageSelectionButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
        
    }
}


extension AddNewMusicVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
            delegate?.addMusic(music: Music(title: imageTitleTextField.text ?? "Default Title", image: image))
            
            dismiss(animated: true)
        }
    }
}



// MARK: - Preview

#Preview {
    AddNewMusicVC()
}
