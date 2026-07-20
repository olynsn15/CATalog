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
            VStack(spacing: 40) {
                Image(systemName: "cat.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.gray)
                
                VStack(spacing: 5){
                    Text("Meet a cat?")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Text("Start your CATalog")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
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
