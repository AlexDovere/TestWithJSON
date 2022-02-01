//
//  ContentViewModel.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation
import SwiftUI

class AlbumViewModel: ObservableObject {
    @Published private(set) var albums: [Album] = []

    init() {
        Task.init {
            await getAlbum()
        }
    }

    private func getAlbum() async {
        do {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedAlbums = try decoder.decode([Album].self, from: data)

            DispatchQueue.main.async {
                self.albums = decodedAlbums
            }
            
            print("Async decodedAlbums", decodedAlbums)
        } catch {
            print(error)
        }
    }
}
