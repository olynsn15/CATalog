//
//  DropdownField.swift
//  CATalog
//
//  Created by Carolyn Santana on 03/08/26.
//

import SwiftUI

struct DropdownField<Content: View>: View {

    let title: String
    let placeholder: String
    @ViewBuilder let content: Content

    var body: some View {

        Menu {

            content

        } label: {

            HStack {

                Text(title.isEmpty ? placeholder : title)
                    .foregroundStyle(
                        title.isEmpty
                        ? .secondary
                        : .primary
                    )

                Spacer()

                Image(systemName: "chevron.down")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)

            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))

        }
        .buttonStyle(.plain)

    }

}
