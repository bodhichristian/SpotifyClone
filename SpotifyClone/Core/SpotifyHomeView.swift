//
//  SpotifyHomeView.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    @Environment(\.router) var router
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = .all
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView{
                LazyVStack(spacing: 2, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 24){
                            recentsSection
                                .padding(.horizontal, 16)

//                            if let product = products.first {
//                                newReleaseSection(product: product)
//                                    .padding(.horizontal, 16)
//                            }
                            listRows
                        }
                    } header: {
                        header
                    }
                }
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            products = try await Array(DataBaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                let products = self.products.filter { $0.brand == brand }
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack{
                if let currentUser {
                    ImageLoaderView(url: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 30)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.leading)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)

                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(products) { product in
                            PlaylistGridItem(
                                imageURL: product.firstImage,
                                title: product.title,
                                style: .artistMix
                            )
                            .asButton(.press) {
                                goToPlayListView(product: product)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageURL: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                    goToPlayListView(product: product)

                }
            }
            
        }
    }
    
    private func goToPlayListView(product: Product) {
        guard let currentUser else { return }
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(
                product: product,
                user: currentUser
            )
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageURL: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
                goToPlayListView(product: product)
            }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}






