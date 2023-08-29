//
//  ContentView.swift
//  Restart
//
//  Created by Lucas Correa on 24/07/2023.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
