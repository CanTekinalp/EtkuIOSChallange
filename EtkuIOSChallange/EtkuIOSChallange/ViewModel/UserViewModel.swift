//
//  UserViewModel.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import Foundation
import GoogleMaps

class UserViewModel {
    private var user: User
    var about: String
    var name: String
    var gender: String
    var age: String
    var email: String
    var phone: String
    var eyeColor: String
    var address: String
    var company: String
    var id: String
    var navigationTitle: String
    
    var mapCoordinates: CLLocationCoordinate2D {
        let latitude = CLLocationDegrees(exactly: self.user.latitude)!
        let longitude = CLLocationDegrees(exactly: self.user.longitude)!
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(user: User) {
        self.name = user.name
        self.about = user.about
        self.phone = user.phone
        self.gender = user.gender
        self.age = String(user.age)
        self.eyeColor = user.eyeColor
        self.address = user.address
        self.company = user.company
        self.email = user.email
        self.id = user.id
        self.navigationTitle = user.navigation_title
        self.user = user
    }

}
