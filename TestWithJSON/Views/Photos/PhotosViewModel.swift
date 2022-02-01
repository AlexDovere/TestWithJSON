//
//  PhotosViewModel.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation

class PhotosViewModel: ObservableObject {
    @Published private(set) var photos: [Photo] = []

    init() {
        Task.init {
            await getPhotos()
        }
    }

    private func getPhotos() async {
        do {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedPhoto = try decoder.decode([Photo].self, from: data)

            DispatchQueue.main.async {
                self.photos = decodedPhoto
            }

            print("Async decodedPhoto", decodedPhoto)
        } catch {
            print(error)
        }
    }
}
