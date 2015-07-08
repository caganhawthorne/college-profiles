//
//  College.swift
//  Cagan College
//
//  Created by Julianne Knott on 7/7/15.
//  Copyright © 2015 Julianne Knott. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var location = ""
    var enrollment =  0
    var image = UIImage(named: "Default")
    var web = "http://google.com"
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage) {
        self.init()
        self.name = name
        self.enrollment = enrollment
        self.location = location
        self.image = image
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }


}
