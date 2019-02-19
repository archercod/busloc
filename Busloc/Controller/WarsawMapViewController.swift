//
//  WarsawMapViewController.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import UIKit
import MapKit

class WarsawMapViewController: UIViewController {
    
    // MARK: - Enums
    
    enum CellIdentifier: String {
        case LineCell = "LineCell"
    }
    
    // MARK: - Properties
    
    var warsawAllBuses = [Warsaw]()
    var warsawAllTrams = [Warsaw]()
    
    var selectedLines = [String]()
    
    var requestTimer: Timer?
    
    var requestRepeatInterval: Double = 10.0
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate(set) var mapView: MKMapView!
    @IBOutlet fileprivate(set) var linesTableView: UITableView!

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        
        linesTableView.delegate = self
        linesTableView.dataSource = self
        
        linesTableView.register(LineTableViewCell.ViewConfiguration.default.nib, forCellReuseIdentifier: CellIdentifier.LineCell.rawValue)
        
        self.getAllBuses(completion: {
             self.displayAllBusesOnMap()
        })
        
        self.getAllTrams(completion: {
            self.displayAllTramsOnMap()
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: - Setups

    func setupView() {
        
        title = "Warszawa"
        navigationItem.largeTitleDisplayMode = .never
        
        selectedLines.append("170")
        selectedLines.append("220")
        selectedLines.append("520")
    }
    
    // MARK: - Annotation
    
    /// Display all available buses on map
    ///
    func displayAllBusesOnMap() {
        
        for bus in warsawAllBuses {
            guard let longitude = bus.Lon, let latitude = bus.Lat else { return }
            
            let busAnnotation = BusAnnotation(title: bus.Lines, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            
            mapView.addAnnotation(busAnnotation)
        }
    }
    
    /// Display all available trams on map
    ///
    func displayAllTramsOnMap() {
        
        for tram in warsawAllTrams {
            guard let longitude = tram.Lon, let latitude = tram.Lat else { return }
            
            let tramAnnotation = TramAnnotation(title: tram.Lines, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            
            mapView.addAnnotation(tramAnnotation)
        }
    }
    
    // MARK: - Data
    
    /// Get all available buses on map
    ///
    /// - Parameter completion: @escaping () -> Void
    func getAllBuses(completion: @escaping () -> Void ) {
        
        WarsawService.shared.fetchWarsawBusList { (data) in
            DispatchQueue.main.async {
                self.warsawAllBuses = data
                completion()
            }
        }
        
        self.requestTimer = Timer.scheduledTimer(withTimeInterval: requestRepeatInterval, repeats: true, block: { (timer) in
            WarsawService.shared.fetchWarsawBusList { (data) in
                DispatchQueue.main.async {
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    self.warsawAllBuses.removeAll()
                    self.warsawAllBuses = data
                    completion()
                }
            }
        })
        
    }
    
    /// Get all available trams on map
    ///
    /// - Parameter completion: @escaping () -> Void
    func getAllTrams(completion: @escaping () -> Void) {
        
        WarsawService.shared.fetchWarsawTramList { (data) in
            DispatchQueue.main.async {
                self.warsawAllTrams = data
            }
        }
        
        self.requestTimer = Timer.scheduledTimer(withTimeInterval: requestRepeatInterval, repeats: true, block: { (timer) in
            WarsawService.shared.fetchWarsawTramList { (data) in
                DispatchQueue.main.async {
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    self.warsawAllTrams.removeAll()
                    self.warsawAllTrams = data
                }
            }
        })
    }
    
}

// MARK: - UITableViewDataSource

extension WarsawMapViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.LineCell.rawValue, for: indexPath) as? LineTableViewCell else { return UITableViewCell() }
        
        let lineNumber = selectedLines[indexPath.row]
        
        cell.fill(lineNumber: lineNumber)
        
        return cell
    }

}

// MARK: - UITableViewDelegate

extension WarsawMapViewController: UITableViewDelegate {
    
    
    
}

// MARK: - MKMapViewDelegate

extension WarsawMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        return MKAnnotationView()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("selected")
    }
    
}
