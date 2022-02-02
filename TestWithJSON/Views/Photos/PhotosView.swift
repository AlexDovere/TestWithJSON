//
//  PhotosView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import SwiftUI

struct PhotosView: View {
    @StateObject var viewModel = PhotosViewModel()
    var columnGrid: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnGrid) {
                    asyncImages
                }
            }
            .navigationTitle(Text("Photos"))
        }
    }

    var asyncImages: some View {
        ForEach(viewModel.photos) { photo in
            AsyncImage(url: URL(string: photo.url)) { image in
                NavigationLink(destination: {
                    ZStack {
                        AsyncImage(url: URL(string: photo.url))
                        Text(photo.title)
                    }
                }, label: {
                    VStack {
                        image
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width/3) - 1,
                                   height: (UIScreen.main.bounds.width/3) - 1)
                    }                })
            } placeholder: {
                VStack {
                    Image(systemName: "photo")
                }
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
