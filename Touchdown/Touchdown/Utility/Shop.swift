//
//  Shop.swift
//  Touchdown
//
//  Created by Lucas Correa on 29/08/2023.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
