//
//  hosting.swift
//  Evandays
//
//  Created by David on 4/2/24.
//

import Foundation
import SwiftData

@Model
class hosting {
    let eventName: String
    let eventDate: String
    let eventLocation: String
    let specialFeatures: String
    
    
    init(eventName: String , eventDate: String   , eventLocation: String , specialFeatures: String ) {
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventLocation = eventLocation
        self.specialFeatures = specialFeatures
    }
    
}


