//
//  Models.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import Foundation


struct Dropbox{
    var operate : String
    var telephone : String
    var owner : String
    var charity : String
    var latitude : String
    var longitude : String
    var etherAddress : String
    
    init(operate : String, owner : String, charity : String, latitude : String, longitude : String, etherAddress: String, telephone: String) {
        self.operate = operate
        self.owner = owner
        self.charity = charity
        self.latitude = latitude
        self.longitude = longitude
        self.etherAddress = etherAddress
        self.telephone = telephone
    }
}


