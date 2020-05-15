//
//  Model.swift
//  ListFragments
//
//  Created by alok singh  on 14/05/20.
//  Copyright © 2020 alok singh . All rights reserved.
//

import Foundation


struct Weight: Codable {
    let imperial:String?
    let metric:String?
}

struct Height: Codable {
    let imperial:String?
    let metric:String?
}


struct DataModel: Codable {
    let description: String?
    let country_code: String?
    let bred_for:String?
    let origin:String?
    let id:Int?
    let url: String?
    let name: String?
    let breed_group: String?
    let temperament: String?
    let life_span: String?
    let weight: Weight?
    let height: Height?
    
}
