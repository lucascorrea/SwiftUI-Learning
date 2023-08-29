//
//  CenterModifier.swift
//  Africa
//
//  Created by Lucas Correa on 29/08/2023.
//

import Foundation
import SwiftUI

struct CenterModfifer: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
