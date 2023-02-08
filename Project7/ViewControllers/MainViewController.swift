//
//  ViewController.swift
//  Project7
//
//  Created by Ильфат Салахов on 02.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    

    // MARK: -Private properties
    private var petitions = [Petition]()
    let networkManager = NetworkManager()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // MARK: -Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupView()
        networkManager.fetchPetision { [weak self] result in
            switch result {
            case .success(let petisions):
                self?.petitions = petisions
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: -Private Methods
    private func setupView() {
        view.addSubview(tableView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let petition = petitions[indexPath.row]
        content.text = petition.title
        content.secondaryText = petition.body
        cell.contentConfiguration = content
        return cell
    }
}


