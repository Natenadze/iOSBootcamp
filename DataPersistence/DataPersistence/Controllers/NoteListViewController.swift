//
//  NoteListViewController.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//


import UIKit

final class NoteListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView = UITableView()
    private var plusButton = UIBarButtonItem()
    private var editButton = UIBarButtonItem()
    private var noteList: [Note] = []
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init
    init(noteList: [Note]) {
        self.noteList = noteList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    @objc private func plusButtonTapped() {
        let vc = AddNoteViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func editButtonTapped() {
        tableView.isEditing = tableView.isEditing ? false : true
        
    }
    
    
}


// MARK: - Style & Layout

extension NoteListViewController {
    
    
    private func style() {
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        
        plusButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(plusButtonTapped)
        )
        
        editButton = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(editButtonTapped)
        )
        
        navigationItem.rightBarButtonItem = plusButton
        navigationItem.leftBarButtonItem = editButton
        
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
    }
}

// MARK: - TableView DataSource

extension NoteListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = noteList[indexPath.row]
        cell.textLabel?.text = note.noteText
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            noteList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

// MARK: - tableView Delegate

extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = NoteDetailsViewController(note: noteList[indexPath.row], index: indexPath.row)
        vc.updateNote = { [weak self] updatedText in
            self?.noteList[indexPath.row].noteText = updatedText
            self?.tableView.reloadData()
        }
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        noteList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    
    // MARK: - Header
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = "Notes"
        
        headerView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    
}




// MARK: - protocol Conformance

extension NoteListViewController: AddNewNoteDelegate {
    
    func addNote(_ note: Note) {
        noteList.append(note)
        tableView.reloadData()
    }
}


