//
//  VideoListView.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import SwiftUI

struct VideoListView: View {

    @State var videos: [Video] = Bundle.main.decode("videos.json")

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: {
                        VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    }, label: {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }) 
                }
//                .listRowBackground(Color.clear)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
