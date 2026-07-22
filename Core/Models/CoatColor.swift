//
//  CoatColor.swift
//  CATalog
//
//  Created by Carolyn Santana on 17/07/26.
//


enum CoatColor: String, Codable, CaseIterable, Identifiable {
    case orange
    case black
    case white
    case gray
    case brown
    case calico
    case tuxedo
    case tabby
    case tortoiseshell
    case other
    case unknown
    
    var id: Self { self }
    
    var displayName: String {
        switch self {
        case .orange: return "Orange"
        case .black: return "Black"
        case .white: return "White"
        case .gray: return "Gray"
        case .brown: return "Brown"
        case .calico: return "Calico"
        case .tuxedo: return "Tuxedo"
        case .tabby: return "Tabby"
        case .tortoiseshell: return "Tortoiseshell"
        case .other: return "Other"
        case .unknown: return "Unknown"
        }
    }
}
