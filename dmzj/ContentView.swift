//
//  ContentView.swift
//  dmzj
//
//  Created by lucio on 2020/11/15.
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
