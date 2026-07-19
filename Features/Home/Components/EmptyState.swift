//
//  EmptyState.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//

import SwiftUI

struct EmptyState: View {
    
    let onCapture: () -> Void
    
    var body: some View {
        
        VStack(spacing: 50) {
            VStack(spacing: 15) {
                Image(systemName: "cat.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.gray)
                
                Text("Capture your first cat.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            Button {
                onCapture()
            } label: {
                Label("Add First Cat",
                      systemImage: "camera.fill")
                .font(.title3.bold())
                .padding(.horizontal, 10)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.orange)
            
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    EmptyState(
        onCapture: { }
    )
    .padding(.horizontal, 24)
}
