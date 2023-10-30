//
//  MainVC.swift
//  TableView
//
//  Created by Davit Natenadze on 29.10.23.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Properties
    let tableView = UITableView()
    var plusButton = UIBarButtonItem()
    var musicList: [Music] = []
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - init
    init(musicList: [Music]) {
        self.musicList = musicList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    // MARK: - Methods
    @objc func plusButtonTapped() {
        let vc = AddNewMusicVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

    
    
}


// MARK: - Style & Layout

extension MainVC {
    
    
    func style() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        
        
        plusButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(plusButtonTapped)
        )

        
        navigationItem.rightBarButtonItem = plusButton
        
    }
    
    func layout() {
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            
            
        ])
        
    }
}

// MARK: - TableView DataSource
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let music = musicList[indexPath.row]
        cell.configure(with: music)
        return cell
    }
}

// MARK: - tableView Delegate

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = musicList[indexPath.row].image
        let title = musicList[indexPath.row].title
        let vc = MusicDetailsVC(image: image, song: title)
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
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
    MainVC(musicList: Music.initial)
}

