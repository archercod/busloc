//
//  TramAnnotation.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import Foundation
import MapKit

class TramAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}
