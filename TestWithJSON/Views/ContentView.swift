//
//  ContentView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var networkReachability = NetworkReachability()

    var body: some View {
        TabView {
            AlbumView().opacity(networkReachability.isReachable ? 1 : 0)
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("Albums")
                }
            PhotosView().opacity(networkReachability.isReachable ? 1 : 0)
                .tabItem {
                    Image(systemName: "photo.circle.fill")
                    Text("Photos")
                }
            PhotoSDView()
                .opacity(networkReachability.isReachable ? 1 : 0)
                .tabItem {
                    Image(systemName: "photo")
                    Text("SD Photo")
                }
        }
        .overlay {
            if !networkReachability.isReachable {

                    Text("Connection failed, please make sure your data connection or wifi is active")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red.cornerRadius(12))
                    .frame(width: UIScreen.main.bounds.width*0.8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
