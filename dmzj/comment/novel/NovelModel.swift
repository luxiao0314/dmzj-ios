//
//  BoutiqueListNewViewModel.swift
//  dmzj
//
//  Created by luxiao on 2021/2/3.
//

import Foundation

class NovelModel: ObservableObject {
    
    @Published var comicLists = [ComicList]()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        //请求排行列表
        Api.request(.getDetectList, model: BoutiqueListNew.self) { (returnData) in
            self.comicLists =  returnData?.comicLists ?? []
        }
    }
}
