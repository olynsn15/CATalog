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
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            VStack(spacing: 12) {
                
                Image(systemName: icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(.orange)
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 130)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(
                color: .black.opacity(0.05),
                radius: 8,
                y: 2
            )
            
            
        }
        .buttonStyle(.plain)
        
    }
    
}

#Preview {
    HStack(spacing: 16) {
        
        AddOptionTile(
            icon: "camera.fill",
            title: "Take Photo"
        ) {}
        
        AddOptionTile(
            icon: "photo.on.rectangle",
            title: "Library"
        ) {}
        
    }
    .padding()
}
