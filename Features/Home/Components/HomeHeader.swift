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
                
                Button {
                    onCameraTap()
                } label: {
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.orange)
                        .clipShape(Circle())
                        .shadow(
                            color: .black.opacity(0.15),
                            radius: 8,
                            x: 0,
                            y: 4
                        )
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
