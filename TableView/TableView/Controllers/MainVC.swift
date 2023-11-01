//
//  MainVC.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

final class MainVC: UIViewController {
    
    // MARK: - Properties
    private let searchBar = UISearchBar()
    
    private let tableView = UITableView()
    private var plusButton = UIBarButtonItem()
    private var editButton = UIBarButtonItem()
    private var musicList: [Music] = []
    private var filteredMusicList: [Music] = []
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init
    init(musicList: [Music]) {
        self.musicList = musicList
        self.filteredMusicList = musicList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    @objc private func plusButtonTapped() {
        let vc = AddNewMusicVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func editButtonTapped() {
        tableView.isEditing = tableView.isEditing ? false : true
        
    }
    
    private func goToMusicDetailsVC(index: Int) {
        let image = musicList[index].image
        let title = musicList[index].title
        let vc = MusicDetailsVC(image: image, song: title)
        show(vc, sender: self)
        
    }
    
    
}


// MARK: - Style & Layout

extension MainVC {
    
    
    private func style() {
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search Music"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        
        
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

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredMusicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let music = filteredMusicList[indexPath.row]
        cell.configure(with: music)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            filteredMusicList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

// MARK: - tableView Delegate

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        goToMusicDetailsVC(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        musicList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
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
        titleLabel.text = "Songs"
        
        headerView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    
}

// MARK: - searchBar Delegate
extension MainVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredMusicList = musicList
            searchBar.resignFirstResponder()
        } else {
            filteredMusicList = musicList.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    
}


// MARK: - protocol Conformance

extension MainVC: AddNewMusicDelegate {
    func addMusic(_ music: Music) {
        musicList.append(music)
        tableView.reloadData()
    }
}



// MARK: - Preview
#Preview {
    UINavigationController(
        rootViewController: MainVC(musicList: Music.initial)
    )
}

