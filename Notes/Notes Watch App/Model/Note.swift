//
//  Note.swift
//  Notes Watch App
//
//  Created by Lucas Correa on 29/08/2023.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}
