//
//  Configs.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import Foundation
import UIKit

// MARK: - App

struct App {
    
    static let AppStoreID = "2222222"
    static let Build = Int(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0") ?? 0
    static let Domain = Bundle.main.bundleIdentifier ?? ""
    static let Name = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    static let Version = Bundle.main.infoDictionary?["CFbundleShortVersionString"] as? String ?? ""
    
}

// MARK: - ApiKey

struct ApiKey {
    
    static let WarsawApiKey = "2f60cd45-95e3-4716-aed8-416323b04236"
    
}

// MARK: - ApiHost

struct WarsawApiHost {
    
    static let singleBus = "api.um.warszawa.pl/api/action/busestrams_get/?resource_id=f2e5503e-927d-4ad3-9500-4ab9e55deb59&apikey=\(ApiKey.WarsawApiKey)&\(WarsawTransportType.bus)"
    static let allBus = "api.um.warszawa.pl/api/action/busestrams_get/?resource_id=f2e5503e-927d-4ad3-9500-4ab9e55deb59&apikey=\(ApiKey.WarsawApiKey)&\(WarsawTransportType.bus)"
    static let singleTram = "api.um.warszawa.pl/api/action/busestrams_get/?resource_id=f2e5503e-927d-4ad3-9500-4ab9e55deb59&apikey=\(ApiKey.WarsawApiKey)&\(WarsawTransportType.tram)"
    static let allTram = "api.um.warszawa.pl/api/action/busestrams_get/?resource_id=f2e5503e-927d-4ad3-9500-4ab9e55deb59&apikey=\(ApiKey.WarsawApiKey)&\(WarsawTransportType.tram)"
    
}

// MARK: - ApiUrl

struct WarsawApiUrl {
    
    static let singleBus = "https://\(WarsawApiHost.singleBus)"
    static let allBus = "https://\(WarsawApiHost.allBus)"
    static let singleTram = "https://\(WarsawApiHost.singleTram)"
    static let allTram = "https://\(WarsawApiHost.allTram)"
    
}

// MARK: - Type

struct WarsawTransportType {
    
    static let bus = "type=1"
    static let tram = "type=2"
    
}
