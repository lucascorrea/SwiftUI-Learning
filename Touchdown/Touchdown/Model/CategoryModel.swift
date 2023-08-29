//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Lucas Correa on 29/08/2023.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
