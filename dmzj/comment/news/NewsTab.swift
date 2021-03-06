//
//  NewsTab.swift
//  dmzj
//
//  Created by luxiao on 2021/2/5.
//

import SwiftUI
import struct Kingfisher.KFImage
import UIKit

struct NewsTab: View {
    
    @ObservedObject var viewModel = NewsModel()
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            List {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.rankingList,id:\.sortId) { comic in
                        VStack {
                            KFImage(URL(string: comic.cover ?? "")!)
                                .placeholder({ Image("ic_placehoulder") })
                                .resizable()
                                .scaledToFit()
                            Text(comic.sortName ?? "").padding(.bottom, 8)
                        }
                        .border(Color.gray, width: 0.2)
                    }
                }
            }
            .onAppear {
                //取消分割线无效
                // To remove only extra separators below the list:
                UITableView.appearance().tableFooterView = UIView()
                // To remove all separators including the actual ones:
                UITableView.appearance().separatorStyle = .none
            }.navigationBarTitle("分类", displayMode: .inline)
        }
    }
}

struct NewsTab_Previews: PreviewProvider {
    static var previews: some View {
        NewsTab()
    }
}
