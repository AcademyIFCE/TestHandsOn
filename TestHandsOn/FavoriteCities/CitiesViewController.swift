//
//  CititesViewController.swift
//  testeClass
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    let table: UITableView = {
        let table = UITableView()
        table.tableFooterView = UIView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private var cities = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "My Favorite Cities"
        constructView()
        setupLayout()
    }
    
    private func constructView() {
        self.view.addSubview(table)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add City", style: .plain, target: self, action: #selector(addCity))
        table.dataSource = self
        table.delegate = self
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            table.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            table.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

    @objc private func addCity() {
        
        let alert = UIAlertController(title: "New City", message: nil, preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.accessibilityIdentifier = "New City TF"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let textfield = alert.textFields?[0], let text = textfield.text, let strongSelf = self else { return }
            strongSelf.table.beginUpdates()
            strongSelf.cities.append(text)
            strongSelf.table.insertRows(at: [IndexPath(row: strongSelf.cities.count - 1, section: 0)], with: .right)
            strongSelf.table.endUpdates()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /// This fucntion removes a city on a given index
    /// - Parameter index: the position of the city on the table view
    private func removeCity(index: IndexPath) {
        table.beginUpdates()
        table.deleteRows(at: [index], with: .left)
        cities.remove(at: index.row)
        table.endUpdates()
    }
}


extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeCity(index: indexPath)
        }
    }
    
}
