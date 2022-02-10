//
//  KFPhoto.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 10/02/22.
//

import SwiftUI
import Kingfisher

struct KFPhotoView: View {
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
                            KFImage(URL(string: photo.url))
                                .placeholder({
                                    Image(systemName: "photo")
                                })
                        }, label: {
                            KFImage(URL(string: photo.thumbnailUrl))
                                .placeholder({
                                    Image(systemName: "photo")
                                })
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.main.bounds.width/3) - 1, height: (UIScreen.main.bounds.width/3) - 1)
                                .cornerRadius(8)
                            .clipped()
                        })
                    }
                }
            }
            .navigationTitle(Text("Kingfisher Photo"))
        }
    }
}

struct KFPhoto_Previews: PreviewProvider {
    static var previews: some View {
        KFPhotoView()
    }
}
