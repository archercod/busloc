//
//  WarsawService.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import Foundation

final class WarsawService {
    
    // MARK: - Properties
    
    static let shared = WarsawService()
    
    // MARK: - Service methods
    
    /// Fetch list of all Warsaw buses
    ///
    /// - Parameter onCompletion: @escaping [Warsaw] model
    func fetchWarsawBusList(onCompletion: @escaping ([Warsaw]) -> ()) {
        
        let urlString = WarsawApiUrl.allBus
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let warsawList = try? JSONDecoder().decode(WarsawList.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            
            onCompletion(warsawList.result)
        }
        
        task.resume()
        
    }
    
    /// Fetch list of all Warsaw trams
    ///
    /// - Parameter onCompletion: @escaping [Warsaw] model
    func fetchWarsawTramList(onCompletion: @escaping ([Warsaw]) -> ()) {
        
        let urlString = WarsawApiUrl.allTram
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let warsawList = try? JSONDecoder().decode(WarsawList.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            
            onCompletion(warsawList.result)
        }
        
        task.resume()
        
    }
    
    /// Fetch Warsaw bus by line number
    ///
    /// - Parameters:
    ///   - number: String number
    ///   - onCompletion: @escaping ([Warsaw]) -> ()
    func fetchWarsawBusByLine(number: String, onCompletion: @escaping ([Warsaw]) -> ()) {
        
        let urlString = "\(WarsawApiUrl.singleBus)&line=\(number)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let warsawBusByLine = try? JSONDecoder().decode(WarsawList.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            
            onCompletion(warsawBusByLine.result)
        }
        
        task.resume()
    }
    
    /// Fetch Warsaw tram by line number
    ///
    /// - Parameters:
    ///   - number: String number
    ///   - onCompletion: @escaping ([Warsaw]) -> ()
    func fetchWarsawTramByLine(number: String, onCompletion: @escaping ([Warsaw]) -> ()) {
        
        let urlString = "\(WarsawApiUrl.singleTram)&line=\(number)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let warsawBusByLine = try? JSONDecoder().decode(WarsawList.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            
            onCompletion(warsawBusByLine.result)
        }
        
        task.resume()
    }
    
}
