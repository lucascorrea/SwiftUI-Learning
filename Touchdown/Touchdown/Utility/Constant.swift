//
//  Constant.swift
//  Touchdown
//
//  Created by Lucas Correa on 29/08/2023.
//

import SwiftUI

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct: Product = products[0]

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(.systemGray4)

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

let feedback = UIImpactFeedbackGenerator(style: .medium)

var safeAreaTop: CGFloat {
    UIApplication.shared.connectedScenes
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter{ $0.isKeyWindow }
        .first?.safeAreaInsets.top ?? 0
}
