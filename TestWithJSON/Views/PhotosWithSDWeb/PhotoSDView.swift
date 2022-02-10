//
//  PhotoSDView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 03/02/22.
//

import SwiftUI
import SDWebImageSwiftUI
/// Different implementation of a view with image downloaded from the web. It is based on an external library, SDWebImageSwiftUI. At the moment this one performs better than the other with AsyncImage. Need more test to understand how use the native AsyncImage properly.

struct PhotoSDView: View {
    
    @StateObject var viewModel = PhotoSDViewModel()

    var columnGrid: [GridItem] =
        [GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnGrid, spacing: 10) {
                    ForEach(viewModel.photos) { photo in
                        NavigationLink(destination: {
                            ZStack {
                                WebImage(url: URL(string: photo.url))
                                Text(photo.title)
                            }
                        }, label: {
                            WebImage(url: URL(string: photo.thumbnailUrl))
                                .placeholder(Image(systemName: "photo"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.main.bounds.width/3) - 1, height: (UIScreen.main.bounds.width/3) - 1)
                                .cornerRadius(8)
                            .clipped()
                        })
                    }
                }.navigationTitle("SD Photos")
            }
        }
    }
}

struct PhotoSDView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSDView()
    }
}
