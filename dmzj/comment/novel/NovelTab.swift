//
//  NewsTab.swift
//  dmzj
//
//  Created by lucio on 2020/11/15.
//
import SwiftUI

struct NovelTab: View {
    
    var colors:[Color] = [.red,.blue,.green,.purple,.pink]
        var body:some View{
            NavigationView{
            List{
                ForEach(0..<5){ i in
                    Section(header:
                        Text("计划:\(i)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width:UIScreen.main.bounds.width,height: 50)
                            .background(self.colors[i])
                        )
                    {
                    ForEach(0..<7){m in
                        Text("子计划:\(m)").listRowInsets(.init(top: 0, leading: 50, bottom: 0, trailing: 0))
                        }
                    }
                }
            }
            .environment(\.defaultMinListHeaderHeight, 40)
//            .listStyle(GroupedListStyle())
            .listStyle(PlainListStyle())
            .navigationBarTitle("GroupedListStyle",displayMode: .inline)
            }
        }
}
