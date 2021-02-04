//
//  ComicsTab.swift
//  dmzj
//
//  Created by luxiao on 2021/2/4.
//

import SwiftUI
import FSPagerView
import struct Kingfisher.KFImage

struct ComicsTab: View {
    
    @ObservedObject var viewModel = BoutiqueListNewViewModel()
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        List(viewModel.comicLists,id:\.sortId){ item in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "heart.fill").foregroundColor(.red).font(.headline)
                    Text(item.itemTitle!).lineLimit(1)
                    Spacer()    //使用Spacer()将Image推到右侧
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding(.trailing, 8)
                }.padding(5)
                LazyVGrid(columns: columns) {
                    ForEach(item.comics!,id:\.comicId) { comic in
                        VStack {
                            KFImage(URL(string: comic.cover ?? "")!)
                                .placeholder({ Image("ic_placehoulder") })
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                            Text(comic.short_description!)
                                .lineLimit(1)
                        }
                    }
                }
            }
        }
        .onAppear {
            //取消分割线无效
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
            // To remove all separators including the actual ones:
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct ComicsTab_Previews: PreviewProvider {
    static var previews: some View {
        ComicsTab()
    }
}

