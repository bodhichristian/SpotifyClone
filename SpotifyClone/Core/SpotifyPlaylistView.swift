//
//  SpotifyPlaylistView.swift
//  SpotifyClone
//
//  Created by christian on 3/31/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showingHeader: Bool = true
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageURL: product.thumbnail
                    )
                    .readingFrame { frame in
                        showingHeader = frame.maxY < 120
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: {
                            
                        },
                        onPlayPressed: {
                            
                        }
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 50,
                            imageURL: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {
                                goToPlayListView(product: product)
                            },
                            onEllipsisPressed: {
                                
                            }
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyDarkGray)
                .offset(y:showingHeader ? 0 : -40)
                .opacity(showingHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showingHeader ? Color.spotifyBlack.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    router.dismissScreen()
                }
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showingHeader)
        .frame(maxHeight: .infinity, alignment: .top)

    }
    
    private func goToPlayListView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(
                product: product
            )
        }
    }
    private func getData() async {
        do {
            products = try await Array(DataBaseHelper().getProducts().prefix(8))

        } catch {
            
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
