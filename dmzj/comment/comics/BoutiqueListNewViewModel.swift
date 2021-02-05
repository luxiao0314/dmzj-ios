//
//  BoutiqueListNewViewModel.swift
//  dmzj
//
//  Created by luxiao on 2021/2/3.
//

import Foundation

class BoutiqueListNewViewModel: ObservableObject {
    
    @Published var comicLists = [ComicList]()
    
    @Published var recommendIndexs = [RecommendIndex]()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        //请求排行列表
        Api.request(.boutiqueListNew(sexType: 0), model: BoutiqueListNew.self) { (returnData) in
            self.comicLists =  returnData?.comicLists ?? []
        }
        
//        Api.request(.recommendIndex, model: RecommendIndex.self) { (returnData) in
//            if let recommendIndexs = [RecommendIndex].deserialize(from: returnData) {
//                print(recommendIndexs ,"recommendIndexs")
//            }
//        }
    }
}
