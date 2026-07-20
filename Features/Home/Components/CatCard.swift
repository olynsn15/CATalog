//
//  CatCard.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//

import SwiftUI

struct CatCard: View {

    let cat: Cat

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            thumbnail

            VStack(alignment: .leading, spacing: 2) {

                Text(cat.name ?? "empty")
                    .font(.headline)
                    .lineLimit(1)

                Text("\(cat.encounters.count) encounters")
                    .font(.caption)
                    .foregroundStyle(.secondary)

            }

        }
    }
}

private extension CatCard {

    @ViewBuilder
    var thumbnail: some View {

        if let image = cat.coverImage {

            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 18))

        } else {

            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemGray6))
                .aspectRatio(1, contentMode: .fit)
                .overlay {

                    Image(systemName: "cat.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)

                }

        }

    }

}

#Preview {
    CatCard(cat: PreviewData.cat(name: "Mochi", encounters: 5))
        .frame(width: 170)
        .padding()
}
