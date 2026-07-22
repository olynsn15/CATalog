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

    let previewCats: [Cat]

    init(previewCats: [Cat] = []) {
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

                            LazyVGrid(
                                columns: columns,
                                spacing: 24
                            ) {

                                ForEach(previewCats) { cat in

                                    CatCard(cat: cat)

                                }

                            }

                        }

                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    .padding(.bottom, 32)

                }

            }

        }
        .sheet(isPresented: $showAddSheet) {

            NavigationStack {
                AddEncounterSheet()
                    .presentationDetents([.fraction(0.35)])
                    .presentationDragIndicator(.visible)
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
            PreviewData.cat(name: "Mochi", encounters: 5),
            PreviewData.cat(name: "Oyen", encounters: 13),
            PreviewData.cat(name: "Latte", encounters: 2),
            PreviewData.cat(name: "Oreo", encounters: 7)
        ]
    )

}
