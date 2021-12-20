//
//  HeroModal.swift
//  MyMarvel
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

struct HeroModal: Decodable {
    let status: String
    let code: Int
    let data:[HeroList]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case data = "data"
    }
};

struct HeroList: Decodable {
    let result:[Hero]
};

struct Hero: Decodable {
    let result:[Hero]
};


