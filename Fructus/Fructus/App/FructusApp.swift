//
//  FructusApp.swift
//  Fructus
//
//  Created by Lucas Correa on 20/08/2023.
//

import SwiftUI

@main
struct FructusApp: App {

    // MARK: - Properties

    @AppStorage("isOnboarding") var isOnBoarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnBoarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
