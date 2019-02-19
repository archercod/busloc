//
//  WarsawModel.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import Foundation

struct WarsawList: Codable {
    
    let result: [Warsaw]
    
}

struct Warsaw: Codable {
    
    let Lat: Double?
    let Lon: Double?
    let Time: String
    let Lines: String
    let Brigade: String
    
}
