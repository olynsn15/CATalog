//
//  CATalogApp.swift
//  CATalog
//
//  Created by Carolyn Santana on 18/07/26.
//


import SwiftUI
import SwiftData

@main
struct CATalogApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Cat.self,
            Encounter.self
        ])
        
        let configuration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(
                for: schema,
                configurations: [configuration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
