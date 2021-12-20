//
//  HeroViewModal.swift
//  MyMarvel
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

class HeroViewModal: NSObject {
    private var webService : WebServiceProtocol!
    
    private(set) var modalData : [String:Any]! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    init(webService : WebServiceProtocol = WebService()) {
        super.init()
        self.webService = webService
    }
    
    public func getDataFromURL(completion : @escaping ([String:Any]) -> ()) {
        let server = "http://gateway.marvel.com/v1/public/characters"
        let path = "?ts=1&apikey=0824d323d0db70ed0cc3a78f9aef9622&hash=c421a63d435179d62bb42cb750827554"
        let url = URL(string: server + path)
        
        self.webService.downloadData(URL: url!, completion: { (modalData:[String : Any]) in
            completion(modalData)
        })
    }
    
    public func getHeroFromURL(heroID:String, completion : @escaping ([String:Any]) -> ()) {
        let server = "http://gateway.marvel.com/v1/public/characters/"
        let path = "?ts=1&apikey=0824d323d0db70ed0cc3a78f9aef9622&hash=c421a63d435179d62bb42cb750827554"
        let url = URL(string: server + heroID + path)
        
        self.webService.downloadData(URL: url!, completion: { (modalData:[String : Any]) in
            completion(modalData)
        })
    }
}
