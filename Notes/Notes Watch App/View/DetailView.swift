//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Lucas Correa on 29/08/2023.
//

import SwiftUI

struct DetailView: View {

    let note: Note
    let count: Int
    let index: Int

    @State private var isCreditPresented: Bool = false
    @State private var isSettingPresented: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            HeaderView()

            Spacer()

            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresented = true
                    }
                    .sheet(isPresented: $isSettingPresented) {
                        SettingsView()
                    }
                Spacer()
                Text("\(count) / \(index + 1) ")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented = true
                    }
                    .sheet(isPresented: $isCreditPresented) {
                        CreditView()
                    }
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData = Note(id: UUID(), text: "Hello, world!")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
