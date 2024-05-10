//
//  Friend.swift
//  Birthdays
//
//  Created by Sarah Clark on 5/10/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthdate: Date

    init(name: String, birthdate: Date) {
        self.name = name
        self.birthdate = birthdate
    }

    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthdate)
    }
}
