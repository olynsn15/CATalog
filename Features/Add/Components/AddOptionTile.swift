//
//  AddOptionTile.swift
//  CATalog
//
//  Created by Carolyn Santana on 22/07/26.
//

import SwiftUI

struct AddOptionTile: View {

    let icon: String
    let title: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon).foregroundColor(.orange).font(.title)

            Text(title)

        }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))

    }

}

#Preview {
    HStack(spacing: 16) {
        
        AddOptionTile(
            icon: "camera.fill",
            title: "Take Photo"
        )
        
        AddOptionTile(
            icon: "photo.on.rectangle",
            title: "Library"
        )
        
    }
    .padding()
}
