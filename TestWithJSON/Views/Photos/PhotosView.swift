//
//  PhotosView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import SwiftUI
/// First try of implementation with native AsyncImage. At the moment it does not perform well, the download of the image seems to be slow and not all the image are downloaded properly.

struct PhotosView: View {
    @StateObject var viewModel = PhotosViewModel()
    var columnGrid: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnGrid) {
//  Split views for better readability. It eliminates right-shifted code problem
                    asyncImages
                }
            }
            .navigationTitle(Text("Photos"))
        }
    }

    var asyncImages: some View {
        ForEach(viewModel.photos) { photo in
            NavigationLink(destination: {
                ZStack {
                    AsyncImage(url: URL(string: photo.url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo")
                    }
                    Text(photo.title)
                }
            }, label: {
                AsyncImage(url: URL(string: photo.thumbnailUrl)) { image in
                    VStack {
                        image.resizable()
                            .frame(width: (UIScreen.main.bounds.width/3) - 1, height: (UIScreen.main.bounds.width/3) - 1)
                            .cornerRadius(8)
                        .clipped()
                    }
                } placeholder: {
                        Image(systemName: "photo")
                        .frame(width: 150, height: 150, alignment: .center)
                }
            })
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
