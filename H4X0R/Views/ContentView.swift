//
//  ContentView.swift
//  H4X0R
//
//  Created by Tomasz Gołkowski on 14/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url))
                {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
        .navigationBarTitle("H4X0R")
    }
    .onAppear{
    self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

