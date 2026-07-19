//
//  HomeView.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var vm = HomeVM()
    @State private var showAddSheet = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let previewCats: [(String, Int)]
    
    init(previewCats: [(String, Int)] = []) {
        self.previewCats = previewCats
    }
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        
                        HomeHeader(
                            totalCats: previewCats.count,
                            onCameraTap: {
                                showAddSheet = true
                            }
                        )
                        
                        
                        
                        if previewCats.isEmpty {
                            
                            EmptyState {
                                showAddSheet = true
                            }
                            .frame(minHeight: geometry.size.height * 0.6)
                            
                        } else {
                            
                            LazyVGrid(columns: columns, spacing: 30) {
                                
                                ForEach(previewCats, id: \.0) { cat in
                                    
                                    CatCard(
                                        name: cat.0,
                                        encounters: cat.1
                                    )
                                    
                                }
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                    
                }
                
            }
            
        }
        .sheet(isPresented: $showAddSheet) {
            NavigationStack {
                AddView()
            }
        }
    }
}

#Preview("Empty") {
    HomeView()
}

#Preview("With Cats") {
    HomeView(
        previewCats: [
            ("Mochi", 5),
            ("Oyen", 13),
            ("Latte", 2),
            ("Oreo", 7)
        ]
    )
}
