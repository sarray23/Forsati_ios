//
//  user.swift
//  Doctor.me
//
//  Created by MACBOOKPRO on 16/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import Foundation


class User:   NSObject, NSCoding {
    
    var id: Int?
    var FirstName: String?
    var Password: String?
    
    
    init?(aId: Int?, aFN: String?,password: String?) {
        self.id = aId
        self.FirstName = aFN
        self.Password = password
        
    }
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.FirstName = decoder.decodeObject(forKey: "FirstName") as? String
        self.Password = decoder.decodeObject(forKey: "Password") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id!, forKey: "id")
        aCoder.encode(self.FirstName, forKey: "FirstName")
        aCoder.encode(self.Password, forKey: "Password")
    }
    
    override var  description : String {
        return "ID patient: \(self.id)" +
            "User First Name: \(self.FirstName)" +
        "Password: \(self.Password)\n"
        
        
    }
}
