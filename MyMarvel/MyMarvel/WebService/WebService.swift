//
//  WebService.swift
//
//  Created by Jeff Chen on 12/17/21.
//

import UIKit

protocol WebServiceProtocol {
    func downloadData(URL sourcesURL:URL, completion : @escaping ([String:Any]) -> ())
}

class WebService: WebServiceProtocol {
    
    func downloadData(URL sourcesURL:URL, completion : @escaping ([String:Any]) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
    
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    completion(responseJSON)
                }
            }
        }.resume()
    }
}
