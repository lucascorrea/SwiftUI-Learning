//
//  VideoModel.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}
