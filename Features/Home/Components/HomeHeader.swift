//
//  HomeHeader.swift
//  CATalog
//
//  Created by Carolyn Santana on 19/07/26.
//

import SwiftUI

struct HomeHeader: View {
    let totalCats: Int
    let onCameraTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            HStack {
                Text("CATalog")
                    .font(.largeTitle.bold())
                
                Spacer()
                
                if #available(iOS 26.0, *) {
                    Button {
                        onCameraTap()
                    } label: {
                        Image(systemName: "camera.fill")
                            .font(.title3.weight(.semibold))
                            .frame(width: 48, height: 48)
                            .contentShape(Circle())
                    }
                    .buttonStyle(.glass)
                } else {
                    // Fallback on earlier versions
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {

                Text("You've met")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("\(totalCats) cats")
                    .font(.title.bold())
            }
        }
    }
}

#Preview("0 Cats") {
    HomeHeader(
        totalCats: 0,
        onCameraTap: { }
    )
    .padding()
}

#Preview("12 Cats") {
    HomeHeader(
        totalCats: 12,
        onCameraTap: { }
    )
    .padding()
}
