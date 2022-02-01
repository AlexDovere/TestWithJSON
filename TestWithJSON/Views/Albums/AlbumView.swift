//
//  AlbumView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import SwiftUI

struct AlbumView: View {
    @StateObject var viewModel = AlbumViewModel()
    var body: some View {
        ScrollView {
            Text("All the album")
                .bold()
                .font(.largeTitle)
            ForEach(viewModel.albums){ album in
                HStack(alignment: .top) {
                    Text("\(album.id)")
                    Text(album.title.firstUppercased)
                }
                .frame(width: 300, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
