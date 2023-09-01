//
//  RipeningModel.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import Foundation

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
