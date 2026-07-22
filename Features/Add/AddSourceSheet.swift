//
//  AddSourceSheet.swift
//  CATalog
//
//  Created by Carolyn Santana on 22/07/26.
//


import SwiftUI
import PhotosUI

struct AddSourceSheet: View {
    @State private var selectedPhoto: PhotosPickerItem?

    let onCameraTap: () -> Void
    let onLibraryImageSelected: (UIImage) -> Void

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

                Button {
                    onCameraTap()
                } label: {
                    AddOptionTile(
                        icon: "camera.fill",
                        title: "Take Photo"
                    )
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)

                PhotosPicker(
                    selection: $selectedPhoto,
                    matching: .images
                ) {
                    AddOptionTile(
                        icon: "photo.on.rectangle.fill",
                        title: "Library"
                    )
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(24)

        .onChange(of: selectedPhoto) { _, newValue in
            Task {
                guard
                    let data = try? await selectedPhoto?.loadTransferable(type: Data.self),
                    let image = UIImage(data: data)
                else {
                    return
                }
                
                onLibraryImageSelected(image)
            }
        }
    }
}

#Preview {
    AddSourceSheet(
        onCameraTap: {},
        onLibraryImageSelected: { _ in }
    )
}
