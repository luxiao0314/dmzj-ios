//
//  NewsTab.swift
//  dmzj
//
//  Created by lucio on 2020/11/15.
//
import SwiftUI

struct NewsTab: View {
    
    @State var list:[Int] = []
        
    var body: some View {
        List(list,id:\.self){ i in
                    Image(systemName: "heart.fill").foregroundColor(.red).font(.headline)
                    Text("完成度:")
                    Text("\(i)")
                        .bold()
                        .foregroundColor(.white).padding(.all,5)
                        .frame(width:(250 * CGFloat(i) / 100) + 40,alignment: .trailing)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                }
                .onAppear{
                    _ = (0...30).map{ _ in
                        self.list.append(Int.random(in: 0...50))
                    }
                }
    }
}
