//
//  AddNewMusicVC.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

// MARK: - protocol
protocol AddNewMusicDelegate: AnyObject {
    func addMusic(_ music: Music)
}

// MARK: - VC

class AddNewMusicVC: UIViewController {
    
    // MARK: - Properties
    private let mainStackView = UIStackView()
    private let songNameLabel = UILabel()
    private let imageTitleTextField = UITextField()
    private let imageView = UIImageView()
    private let selectImageButton = UIButton()
    private let saveButton = UIButton(type: .system)
    private let imagePicker = UIImagePickerController()
    
    weak var delegate: AddNewMusicDelegate?
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
    // MARK: - Methods
    @objc func openPhotoLibrary() {
        present(imagePicker, animated: true)
    }
    
    @objc func saveImagePressed() {
        if let image = imageView.image, let text = imageTitleTextField.text {
            let music = Music(title: text.isEmpty ? "No Title" : text, image: image)
            delegate?.addMusic(music)
            navigationController?.popViewController(animated: true)
        }
    }
    
}


// MARK: - Style & Layout

extension AddNewMusicVC {
    
    
    func style() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        imageTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        
        songNameLabel.text = "Song Name:"
        
        imageTitleTextField.placeholder = "Type Song name"
        imageTitleTextField.autocorrectionType = .no
        imageTitleTextField.backgroundColor = .systemGray6
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        imageView.image = UIImage(systemName: "photo.on.rectangle")
        
        selectImageButton.setTitle("Pick an image", for: .normal)
        selectImageButton.backgroundColor = .systemBlue
        selectImageButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
        
        saveButton.setTitle("Save Music", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.isEnabled = false
        saveButton.backgroundColor = .systemGray
        saveButton.addTarget(self, action: #selector(saveImagePressed), for: .touchUpInside)
        
    }
    
    func layout() {
        mainStackView.addArrangedSubview(songNameLabel)
        mainStackView.addArrangedSubview(imageTitleTextField)
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(selectImageButton)
        mainStackView.addArrangedSubview(saveButton)
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageTitleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            imageView.heightAnchor.constraint(equalToConstant: 225),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            selectImageButton.heightAnchor.constraint(equalToConstant: 44),
            
            saveButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}

// MARK: - extension UIImagePickerControllerDelegate

extension AddNewMusicVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
            dismiss(animated: true)
            saveButton.isEnabled = true
            saveButton.backgroundColor = .systemBlue
        }
    }
}



// MARK: - Preview

#Preview {
    AddNewMusicVC()
}
