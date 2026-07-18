//
//  Cat.swift
//  CATalog
//
//  Created by Carolyn Santana on 17/07/26.
//

import Foundation
import SwiftData

@Model
final class Cat {
    var id: UUID
    var name: String?
    var createdAt: Date
    var notes: String?
    var coatColor: CoatColor?

    @Relationship(deleteRule: .cascade)
    var encounters: [Encounter]

    init(
        name: String? = nil,
        notes: String? = nil,
        coatColor: CoatColor? = nil
    ) {
        id = UUID()
        createdAt = Date()

        self.name = name
        self.notes = notes
        self.coatColor = coatColor

        encounters = []
    }
}

extension Cat {

    var encounterCount: Int {
        encounters.count
    }

    var firstEncounter: Date? {
        encounters.min(by: { $0.date < $1.date })?.date
    }

    var lastSeen: Date? {
        encounters.max(by: { $0.date < $1.date })?.date
    }
}
