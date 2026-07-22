//
//  AddVM.swift
//  CATalog
//
//  Created by Carolyn Santana on 22/07/26.
//

import Foundation
import Observation

@Observable
final class AddVM {

    enum Mode: String, CaseIterable, Identifiable {
        case new
        case existing

        var id: Self { self }

        var title: String {
            switch self {
            case .new:
                return "New Cat"
            case .existing:
                return "Existing Cat"
            }
        }
    }

    var mode: Mode = .new

    var catName = ""

    var coatColor: CoatColor = .unknown

    /// Temporary placeholder.
    /// Later this will come from @Query.
    var existingCats = [
        "Mochi",
        "Oyen",
        "Latte",
        "Oreo"
    ]

    var selectedExistingCat = ""

    var notes = ""


    var canSave: Bool {
        switch mode {

        case .new:
            return !catName.trimmingCharacters(in: .whitespaces).isEmpty

        case .existing:
            return !selectedExistingCat.isEmpty
        }
    }

}
