//
//  PreviewData.swift
//  CATalog
//
//  Created by Carolyn Santana on 20/07/26.
//


import UIKit

enum PreviewData {

    static func cat(
        name: String,
        encounters: Int = 1
    ) -> Cat {

        let cat = Cat(name: name)

        let image = UIImage(named: "cat_sample")!.pngData()!

        for _ in 0..<encounters {
            cat.encounters.append(
                Encounter(photo: image)
            )
        }

        return cat

    }

}
