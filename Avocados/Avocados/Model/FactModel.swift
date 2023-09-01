//
//  FactModel.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import Foundation


struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
