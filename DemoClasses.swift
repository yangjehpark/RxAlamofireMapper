//
//  IndividualProfile.swift
//  TechStack
//
//  Created by Wassim on 2/20/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import ObjectMapper


class User : NSObject, Mappable{
    
    var city : String?
    var country : String?
    var countryIso : String?
    var dateOfBirth : String?
    var firstName : String?
    var id : Int?
    var image : String?
    var lastName : String?
    var title : String?
    
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        city <- map["city"]
        country <- map["country"]
        countryIso <- map["country_iso"]
        dateOfBirth <- map["date_of_birth"]
        firstName <- map["first_name"]
        id <- map["id"]
        image <- map["image"]
        lastName <- map["last_name"]
        title <- map["title"]
        
    }

}
