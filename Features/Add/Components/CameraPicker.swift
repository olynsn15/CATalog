//
//  CameraPicker.swift
//  CATalog
//
//  Created by Carolyn Santana on 03/08/26.
//

import SwiftUI
import UIKit

struct CameraPicker: UIViewControllerRepresentable {

    @Environment(\.dismiss)
    private var dismiss

    let onImagePicked: (UIImage) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(
        context: Context
    ) -> UIImagePickerController {

        let picker = UIImagePickerController()
        
        picker.modalPresentationCapturesStatusBarAppearance = true
        picker.modalPresentationStyle = .fullScreen

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }

        picker.delegate = context.coordinator
        picker.allowsEditing = false

        return picker
    }

    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: Context
    ) { }

}

extension CameraPicker {

    final class Coordinator:
        NSObject,
        UINavigationControllerDelegate,
        UIImagePickerControllerDelegate {

        let parent: CameraPicker

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {

            guard let image = info[.originalImage] as? UIImage else {
                parent.dismiss()
                return
            }

            parent.onImagePicked(image)

            parent.dismiss()

        }

        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController
        ) {

            parent.dismiss()

        }

    }

}
