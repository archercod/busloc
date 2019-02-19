//
//  CitiesListViewController.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    // MARK: - Enums
    
    enum CellIdentifier: String {
        case CityCell = "CityCell"
    }
    
    enum Segues: String {
        case toWarsawMap = "seg_toWarsawMap"
    }
    
    enum CellHeight: CGFloat {
        case cityCellHeight = 50.0
    }
    
    // MARK: - Properties
    
    let cities = ["Warszawa"]
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate(set) var tableView: UITableView!
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Delegates
        
        tableView.delegate = self
        tableView.dataSource = self
        
        /// View setups
        
        self.setupView()
        
        /// Xib cell registration
        
        tableView.register(CityTableViewCell.ViewConfiguration.default.nib, forCellReuseIdentifier: CellIdentifier.CityCell.rawValue)
    }
    
    // MARK: - Setups

    func setupView() {
        
        title = "Wybierz miasto"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

// MARK: - UITableViewDataSource

extension CitiesListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.CityCell.rawValue, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
        
        let cityName = cities[indexPath.row]
        
        cell.fill(title: cityName)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: Segues.toWarsawMap.rawValue, sender: nil)
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellHeight.cityCellHeight.rawValue
    }
    
}

// MARK: - UITableViewDelegate

extension CitiesListViewController: UITableViewDelegate {
    
}

