//
//  LocationModel.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(latitude, longitude)
    }
}
