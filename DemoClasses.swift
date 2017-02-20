//
//  IndividualProfile.swift
//  TechStack
//
//  Created by Wassim on 2/20/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import ObjectMapper


class IndividualProfile : NSObject, NSCoding, Mappable{
    
    var city : String?
    var country : String?
    var countryIso : String?
    var dateOfBirth : String?
    var firstName : String?
    var id : Int?
    var image : String?
    var lastName : String?
    var title : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return IndividualProfile()
    }
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
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        city = aDecoder.decodeObject(forKey: "city") as? String
        country = aDecoder.decodeObject(forKey: "country") as? String
        countryIso = aDecoder.decodeObject(forKey: "country_iso") as? String
        dateOfBirth = aDecoder.decodeObject(forKey: "date_of_birth") as? String
        firstName = aDecoder.decodeObject(forKey: "first_name") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        lastName = aDecoder.decodeObject(forKey: "last_name") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }

        if country != nil{
            aCoder.encode(country, forKey: "country")
        }
        if countryIso != nil{
            aCoder.encode(countryIso, forKey: "country_iso")
        }
        if dateOfBirth != nil{
            aCoder.encode(dateOfBirth, forKey: "date_of_birth")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "first_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "last_name")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
}
