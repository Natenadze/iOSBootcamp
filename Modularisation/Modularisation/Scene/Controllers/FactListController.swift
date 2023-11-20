//
//  ViewController.swift
//  Modularisation
//
//  Created by Davit Natenadze on 19.11.23.
//

import UIKit

final class FactListController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: FactListControllerViewModel
    
    // MARK: - UI Elements
    private let tableView = UITableView()
    
    
    // MARK: - lifeCycle
    init(viewModel: FactListControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
    }
    
    
    // MARK: - Methods
    private func setupViewModel() {
        viewModel.viewDidLoad()
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

}



// MARK: - extension TableView DataSource

extension FactListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCatFactsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getCatFact(indexPath.row)
        return cell
    }
    
    
}

// MARK: - extension FactListController Delegate

extension FactListController: FactListControllerDelegate {
    
    func networkingDone() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

