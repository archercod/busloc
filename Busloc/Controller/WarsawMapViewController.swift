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
    
    // MARK: - Properties
    
    var warsawAllBuses = [Warsaw]()
    var warsawAllTrams = [Warsaw]()
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate(set) var mapView: MKMapView!

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        
        self.getAllBuses()
        self.getAllTrams()
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
    }
    
    // MARK: - Data
    
    func getAllBuses() {
        
        WarsawService.shared.fetchWarsawBusList { (data) in
            DispatchQueue.main.async {
                self.warsawAllBuses = data
            }
        }
        
    }
    
    func getAllTrams() {
        
        WarsawService.shared.fetchWarsawTramList { (data) in
            DispatchQueue.main.async {
                self.warsawAllTrams = data
            }
        }
    }
    
}

extension WarsawMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        return MKAnnotationView()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("selected")
    }
    
}
