//
//  ContentView.swift
//  Hacker News
//
//  Created by Mikail on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.post){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
               
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear(perform: {
            self.networkManager.fetch()
        })
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post:Identifiable{
//    let id:String
//    let tite:String
//}


//let posts = [
//    Post(id: "1", tite: "Hello"),
//    Post(id: "1", tite: "Bonjour"),
//    Post(id: "1", tite: "How You"),
//    Post(id: "1", tite: "Salam")
//
//
//]
