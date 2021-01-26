//
//  NewsTab.swift
//  dmzj
//
//  Created by lucio on 2020/11/15.
//
import SwiftUI

struct MineTab: View {
    
    var colors:[Color] = [.red,.yellow,.blue,.green,.pink,.orange]
        var body:some View{
            List{
                ForEach(0..<20) { i in
                    Text("ID:\(i)").listRowBackground(self.colors[i % self.colors.count])
                }
            }
        }
}
