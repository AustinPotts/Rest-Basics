//
//  PersonController.swift
//  Find A Crew
//
//  Created by Austin Potts on 10/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
enum HTTPMethod: String{
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class PersonController {
    
    
    let baseURL = URL(string: "https://swapi.co/api/")!
    
    var people: [Person] = []
    
    func searchForPeople(with searchTerm: String, completion: @escaping()-> Void){
        
        // Build out the URL
        let peopleURL = baseURL.appendingPathComponent("people")
        
        
        //Only doing this for Search Component
        var components = URLComponents(url: peopleURL, resolvingAgainstBaseURL: true)
        
        let searchQueryItem = URLQueryItem(name: "search", value: searchTerm)
        
        components?.queryItems = [searchQueryItem]
        
        
        //Ask the components to give us the formatted URL from the parts we gvce it
        guard let requestURL = components?.url else{
            completion()
            return
        }
        
        //Create a URL Request
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        
        
        
        //Perform the request (with a datatask)
        URLSession.shared.dataTask(with: request) { (data ,_, error) in
            
            //Error Handling
            if let error = error {
                NSLog("error fetching tasks: \(error)")
            }
            
            guard let data = data else{
                NSLog("No data")
                completion()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let personSearch = try decoder.decode(PersonSearch.self, from: data)
                
                self.people = personSearch.results
                
            } catch {
                NSLog("Error decoding: \(error)")
            }
            completion()
            
        }.resume()
        
        
        
        
        
        
        
        
    }
    
    
}
