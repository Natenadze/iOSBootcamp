//
//  AddNoteViewController.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit

// MARK: - protocol
protocol AddNewNoteDelegate: AnyObject {
    func addNote(_ note: Note)
}


// MARK: - ViewController
final class AddNoteViewController: UIViewController {
    
    // MARK: - Properties
    private let noteTextView = UITextView()
    private var saveButton = UIBarButtonItem()
    
    weak var delegate: AddNewNoteDelegate?
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
    // MARK: - Methods

    
    @objc func saveImagePressed() {
        
        let note = Note(noteText: noteTextView.text ?? "asd")
        delegate?.addNote(note)
        navigationController?.popViewController(animated: true)
        
    }
    
}


// MARK: - Style & Layout

extension AddNoteViewController {
    
    
    private func style() {
   
        noteTextView.translatesAutoresizingMaskIntoConstraints = false

       
        noteTextView.backgroundColor = .secondarySystemBackground
        noteTextView.textColor = .black
        noteTextView.isEditable = true
        noteTextView.isScrollEnabled = true
        noteTextView.font = .systemFont(ofSize: 22)
        noteTextView.autocorrectionType = .no
    
        
        saveButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveImagePressed)
        )
        
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = "Note"
        
        
    }
    
    private func layout() {
        
        view.addSubview(noteTextView)
        
        NSLayoutConstraint.activate([
            noteTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noteTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}



// MARK: - Preview
#Preview {
    UINavigationController(rootViewController: AddNoteViewController())
    
}

