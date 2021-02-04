//
//  ContentView.swift
//  dmzj
//
//  Created by luxiao on 2021/2/4.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            ComicsTab()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("漫画")
                    }
                }
            NewsTab()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("新闻")
                    }
                }
            NovelTab()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("小说")
                    }
                }
            MineTab()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("我的")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
