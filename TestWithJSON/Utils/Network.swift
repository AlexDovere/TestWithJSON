//
//  Network.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation

class Network: ObservableObject {

    // HTTP Request using completion handlers, old method
    func getRandomAlbumWithCompletionHandler() -> [Album] {
        var decodedAlbums = [Album]()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let albums = try JSONDecoder().decode([Album].self, from: data)
                        decodedAlbums = albums
                        print("decoded Albums", decodedAlbums)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }

        }
        dataTask.resume()
        return decodedAlbums
    }


    func getPhotos() async throws -> [Photo] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedPhotos = try JSONDecoder().decode([Photo].self, from: data)
        print("Async decodedPhoto", decodedPhotos)

        return decodedPhotos
    }
}
