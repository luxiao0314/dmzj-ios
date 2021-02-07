//
//  NovelTab.swift
//  dmzj
//
//  Created by luxiao on 2021/2/5.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NovelTab: View {
    
    @ObservedObject var viewModel = NovelModel()
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var columnTwo: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    
    var columnFive: [GridItem] =
        Array(repeating: .init(.flexible()), count: 5)
    
    var body: some View {
        NavigationView {
            List(viewModel.comicLists,id:\.sortId){ item in
                if(item.comicType == 11) {
                    LazyVGrid(columns: columnFive) {
                        ForEach(item.comics!,id:\.name) { comic in
                            VStack {
                                KFImage(URL(string: comic.cover ?? "")!)
                                    .placeholder({ Image("ic_placehoulder") })
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 100)
                            }
                        }
                    }
                } else {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.fill").foregroundColor(.red).font(.headline)
                            Text(item.itemTitle ?? "").lineLimit(1)
                            Spacer()    //使用Spacer()将Image推到右侧
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .font(.headline)
                                .padding(.trailing, 8)
                        }.padding(5)
                        
                        if(item.itemTitle == "超人气作品") {
                            LazyVGrid(columns: columnTwo) {
                                ForEach(item.comics ?? [],id:\.comicId) { comic in
                                    VStack (alignment: .leading) {
                                        KFImage(URL(string: comic.cover ?? "")!)
                                            .placeholder({ Image("ic_placehoulder") })
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 104)
                                        Text(comic.name ?? "")
                                            .lineLimit(1)
                                    }
                                }
                            }
                        } else if(item.itemTitle == "订阅漫画") {
                            LazyVGrid(columns: columns) {
                                ForEach(item.comics ?? [],id:\.comicId) { comic in
                                    let cover = comic.cover ?? ""
                                    if(!cover.contains("ubig")) {
                                        VStack {
                                            KFImage(URL(string: comic.cover ?? "")!)
                                                .placeholder({ Image("ic_placehoulder") })
                                                .resizable()
                                                .scaledToFill()
                                                .frame(height: 155)
                                            Text(comic.name ?? "")
                                                .lineLimit(1)
                                        }
                                    }
                                }
                            }
                        } else {
                            LazyVGrid(columns: columns) {
                                ForEach(item.comics!,id:\.name) { comic in
                                    VStack {
                                        KFImage(URL(string: comic.cover ?? "")!)
                                            .placeholder({ Image("ic_placehoulder") })
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 155)
                                        Text(comic.name ?? "")
                                            .lineLimit(1)
                                    }
                                }
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
                UITableView.appearance().separatorColor = .clear
            }.navigationTitle("漫画")
        }
    }
}

struct NovelTab_Previews: PreviewProvider {
    static var previews: some View {
        NovelTab()
    }
}
