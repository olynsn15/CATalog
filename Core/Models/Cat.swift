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
    var photo: Data
    var encounterCount: Int
    var createdAt: Date
    var firstEncounter: Date
    var lastSeen: Date
    var locationName: String?
    var coatColor: CoatColor?
    var notes: String?
    
    init(
        name: String? = nil,
        photo: Data,
        firstEncounter: Date,
        lastSeen: Date,
        locationName: String? = nil,
        coatColor: CoatColor? = nil,
        notes: String? = nil
    ) {
        self.id = UUID()
        self.name = name
        self.photo = photo
        self.encounterCount = 1
        self.createdAt = Date()
        self.firstEncounter = firstEncounter
        self.lastSeen = lastSeen
        self.locationName = locationName
        self.coatColor = coatColor
        self.notes = notes
    }
}
