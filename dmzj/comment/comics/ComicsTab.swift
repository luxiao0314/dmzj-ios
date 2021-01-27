//
//  ContentView.swift
//  dmzj
//
//  Created by lucio on 2020/11/15.
//

import SwiftUI
import FSPagerView
import Moya
import Alamofire

struct ComicsTab: View {
    
    @State var list:[Int] = []
    
    var galleryItems: [GalleryItem]?
    
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
    
    // 懒加载滚动图片浏览器
    private lazy var pagerView : FSPagerView = {
        let pagerView = FSPagerView()
//        pagerView.delegate = self
//        pagerView.dataSource = self
        pagerView.automaticSlidingInterval =  3
        pagerView.isInfinite = !pagerView.isInfinite
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "ShopBannerCell")
        return pagerView
    }()
    
    private func loadData() {
//        //请求排行列表
//        Api.request(.boutiqueListNew(sexType: 0), model: BoutiqueListNew.self) { (returnData) in
//            self.galleryItems =  returnData?.galleryItems
//            //            self.rankList = returnData?.rankinglist ?? []
//            //            //停止刷新
//            //            self.tableView.uHead?.endRefreshing()
//            //            self.tableView.uempty?.allowShow = true
//            //            //重新加载数据
//            //            self.tableView.reloadData()
//        }
    }
}

//extension ComicsTab: FSPagerViewDelegate, FSPagerViewDataSource {

//    // - FSPagerView Delegate
//    func numberOfItems(in pagerView: FSPagerView) -> Int {
//        return self.galleryItems!.count
//    }
//
//    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
//        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCell", at: index)
//        cell.imageView?.kf.setImage(with: URL(string:(self.galleryItems?[index].url)!))
//        return cell
//    }
//
//    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
//        self.pagerControl.currentPage = index
//    }
//
//    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
//        pagerView.deselectItem(at: index, animated: true)
//    }
//}
