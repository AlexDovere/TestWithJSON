//
//  ContentView.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        TabView {
            AlbumView()
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("Albums")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
