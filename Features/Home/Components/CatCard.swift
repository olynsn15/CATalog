//
//  CatCard.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//

import SwiftUI

struct CatCard: View {

    let name: String
    let encounters: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray.opacity(0.15))
                .aspectRatio(1, contentMode: .fit)

            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.headline)

                Text("\(encounters) encounters")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    CatCard(name: "mello", encounters: 20)
}
