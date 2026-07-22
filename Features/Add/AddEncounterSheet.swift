//
//  AddEncounterSheet.swift
//  CATalog
//
//  Created by Carolyn Santana on 22/07/26.
//


import SwiftUI

struct AddEncounterSheet: View {

    var body: some View {

        VStack(spacing: 24) {

            VStack(spacing: 6) {

                Text("Meet a new cat?")
                    .font(.title2.bold())

                Text("How would you like to add it?")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

            }

            HStack(spacing: 16) {

                AddOptionTile(
                    icon: "camera.fill",
                    title: "Take Photo"
                ) {
                    print("Camera")
                }
                .frame(maxWidth: .infinity)

                AddOptionTile(
                    icon: "photo.on.rectangle.fill",
                    title: "Library"
                ) {
                    print("Library")
                }
                .frame(maxWidth: .infinity)

            }

        }
        .padding(24)

    }

}

#Preview {
    AddEncounterSheet()
}
