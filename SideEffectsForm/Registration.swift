//
//  Registration.swift
//  SideEffectsForm
//
//  Created by Filip Handzel on 18/06/2020.
//  Copyright © 2020 Filip Handzel. All rights reserved.
//

import Foundation

struct Registration {
    
    //Patient Information
    
    var initials: String
    var dateOfBirth: Date
    var gender: String!
    var bodyHeight: String //edit later to String
    var bodyWeight: String //edit later to String
    //    var pregnacy: Bool
    //    var pregnacyWeek: Int
    
    //Side effects information
    
    var dateOfIssue: Date
//    var description: String
//    var heavyEffect: Bool
//    var reaction: String
//    var ProductUsed: ProductUsed
    var additionalInfo: String
//    var report_date: Date
    
}

//struct ProductUsed: Equatable {
//    var name: String
//    var dosing: String
//    var apply_way: Date
//    var date_star: Date
//    var date_end: Date
//    var reason: String
//    var price: Int
//}
