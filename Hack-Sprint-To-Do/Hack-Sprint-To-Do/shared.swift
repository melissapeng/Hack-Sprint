//
//  shared.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/30/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import Foundation

final class Shared {
    static let shared = Shared() //lazy init, and it only runs once
    
    var chosenMinutes: Int!
}
