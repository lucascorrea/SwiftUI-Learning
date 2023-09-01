//
//  SettingsView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct SettingsView: View {

    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 0) {



            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)

                Text("Avocados".uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()

            Form {
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notifications")
                    }

                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background refresh")
                    }
                }

                Section(header: Text("Application")) {
                    if enableNotification {
                        HStack(alignment: .center, spacing: 10) {
                            Text("Product")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("Developer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Lucas Correa")
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("Design")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Robert Petras")
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("Website")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("swiftuimasterclass.com")
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1.1.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("👍🏻 Happy coding!")
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 640)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
