//
//  Encounter.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//

import Foundation
import SwiftData

@Model
final class Encounter {
    var id: UUID
    var photo: Data
    var date: Date
    var locationName: String?

    init(
        photo: Data,
        date: Date = Date(),
        locationName: String? = nil
    ) {

        id = UUID()

        self.photo = photo
        self.date = date
        self.locationName = locationName
    }
}
