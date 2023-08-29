//
//  PageModel.swift
//  Pinch
//
//  Created by Lucas Correa on 25/07/2023.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}
