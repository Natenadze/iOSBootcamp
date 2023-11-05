//
//  NoteDetailsViewController.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private var note: Note
    private var index: Int
    private let noteTextView = UITextView()
    var updateNote: ((String) -> Void)?
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(note: Note, index: Int) {
        self.note = note
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    @objc func backButtonAction() {
        updateNote?(noteTextView.text)
        navigationController?.popViewController(animated: true)
    }
    
    
    
}


// MARK: - Style & Layout

extension NoteDetailsViewController {
    
    
    func style() {
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.text = note.noteText
        noteTextView.backgroundColor = .secondarySystemBackground
        noteTextView.textColor = .black
        noteTextView.isEditable = true
        noteTextView.isScrollEnabled = true
        noteTextView.font = .systemFont(ofSize: 22)
        noteTextView.autocorrectionType = .no
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func layout() {
        
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
//#Preview {
//    NoteDetailsViewController(note: Note(noteText: "asd"))
//}

