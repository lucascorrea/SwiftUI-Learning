//
//  ContentView.swift
//  Pinch
//
//  Created by Lucas Correa on 25/07/2023.
//

import SwiftUI

struct Counter {
    var value: Int = 0

    init() {
        print("Counter init fired")
    }
}


struct ContentView: View {
    // MARK: - Properties
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    @State private var pagesIndex: Int = 1
    @State private var counter = Counter()

    let pages: [Page] = pagesData

    // MARK: - Function

    func resetImageState() {
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }

    func currentPage() -> String {
        pages[pagesIndex - 1].imageName
    }
//    func prepareThumbnail(of size: CGSize, completionHandler: @escaping)

    // MARK: - Content

    var body: some View {

        VStack {
            Text("\(counter.value)")
            Button("Increment") {
                counter.value += 1
            }
        }

//        NavigationView {
//            ZStack {
//                Color.clear
//                Image(currentPage())
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(10)
//                    .padding()
//                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2 , y: 2)
//                    .opacity(isAnimating ? 1 : 0)
//                    .offset(x: imageOffset.width, y: imageOffset.height)
//                    .animation(.linear(duration: 1), value: isAnimating)
//                    .scaleEffect(imageScale)
//                // MARK: - 1. Tap Gesture
//                    .onTapGesture(count: 2) {
//                        if imageScale == 1 {
//                            withAnimation(.spring()) {
//                                imageScale = 5
//                            }
//                        } else {
//                            resetImageState()
//                        }
//                    }
//                // MARK: - 2. Drag Gesture
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                withAnimation(.linear(duration: 1)) {
//                                    imageOffset = value.translation
//                                }
//                            }
//                            .onEnded { _ in
//                                if imageScale <= 1 {
//                                    resetImageState()
//                                }
//                            }
//                    )
//                // MARK: - 3. Magnification
//                    .gesture(
//                        MagnificationGesture()
//                            .onChanged { value in
//                                withAnimation(.linear(duration: 1)) {
//                                    if imageScale >= 1 && imageScale <= 5 {
//                                        imageScale = value
//                                    } else if imageScale > 5 {
//                                        imageScale = 5
//                                    }
//                                }
//                            }
//                            .onEnded { _ in
//                                if imageScale > 5 {
//                                    imageScale = 5
//                                } else if imageScale <= 1 {
//                                    resetImageState()
//                                }
//                            }
//                    )
//            }
//            .navigationTitle("Pinch & Zoom")
//            .navigationBarTitleDisplayMode(.inline)
//            .onAppear {
//                withAnimation(.linear(duration: 1)) {
//                    isAnimating = true
//                }
//            }
//            // MARK: - Info Panel
//            .overlay(
//                InfoPanelView(scale: imageScale, offset: imageOffset)
//                    .padding(.horizontal)
//                    .padding(.top, 30)
//                , alignment: .top
//            )
//
//            // MARK: - Controls
//            .overlay(
//                Group {
//                    HStack {
//                        Button {
//                            withAnimation(.spring()) {
//                                if imageScale > 1 {
//                                    imageScale -= 1
//
//                                    if imageScale <= 1 {
//                                        resetImageState()
//                                    }
//                                }
//                            }
//                        } label: {
//                            ControlImageView(icon: "minus.magnifyingglass")
//                        }
//
//                        Button {
//                            resetImageState()
//                        } label: {
//                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
//                        }
//
//                        Button {
//                            withAnimation(.spring()) {
//                                if imageScale < 5 {
//                                    imageScale += 1
//
//                                    if imageScale > 5 {
//                                        imageScale = 5
//                                    }
//                                }
//                            }
//                        } label: {
//                            ControlImageView(icon: "plus.magnifyingglass")
//                        }
//                    }
//                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(12)
//                    .opacity(isAnimating ? 1 : 0)
//                }
//                    .padding(.bottom, 30)
//                , alignment: .bottom)
//            // MARK: - Drawer
//            .overlay(
//                HStack(spacing: 12) {
//                    // MARK: - Drawer Handle
//                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 40)
//                        .padding(8)
//                        .foregroundStyle(.secondary)
//                        .onTapGesture {
//                            withAnimation(.easeOut) {
//                                isDrawerOpen.toggle()
//                            }
//                        }
//                    // MARK: - Thumbnails
//                    ForEach(pages) { page in
//                        Image(page.thumbnailName)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 80)
//                            .cornerRadius(8)
//                            .shadow(radius: 4)
//                            .opacity(isDrawerOpen ? 1 : 0)
//                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
//                            .onTapGesture {
//                                isAnimating = true
//                                pagesIndex = page.id
//                                withAnimation(.easeOut) {
//                                    isDrawerOpen.toggle()
//                                }
//                            }
//                    }
//                    Spacer()
//                }
//                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(12)
//                    .opacity(isAnimating ? 1 : 0)
//                    .frame(width: 260)
//                    .padding(.top, UIScreen.main.bounds.height / 12)
//                    .offset(x: isDrawerOpen ? 20: 215)
//                , alignment: .topTrailing
//            )
//        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
