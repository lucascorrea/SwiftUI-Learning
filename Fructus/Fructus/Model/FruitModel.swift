//
//  FruitModel.swift
//  Fructus
//
//  Created by Lucas Correa on 20/08/2023.
//

import SwiftUI

// MARK: - Frutis data model

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
