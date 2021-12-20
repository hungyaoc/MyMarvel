//
//  MockWebService.swift
//  MyMarvelTests
//
//  Created by Jeff Chen on 12/19/21.
//
import UIKit

@testable import MyMarvel

class MockWebService: WebServiceProtocol {
    
    func downloadData(URL sourcesURL: URL, completion: @escaping ([String : Any]) -> ()) {
        let data = ["name":"Jeff"]
        completion(data)
    }
    

}
