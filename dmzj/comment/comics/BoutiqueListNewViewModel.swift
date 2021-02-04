//
//  BoutiqueListNewViewModel.swift
//  dmzj
//
//  Created by luxiao on 2021/2/3.
//

import Foundation

class BoutiqueListNewViewModel: ObservableObject {
    
    @Published var comicLists = [ComicList]()
    
    @Published var list:[Int] = []
    
    init() {
        _ = (0...30).map{ _ in
            self.list.append(Int.random(in: 0...50))
        }
        loadData()
    }
    
    private func loadData() {
        //请求排行列表
        Api.request(.boutiqueListNew(sexType: 0), model: BoutiqueListNew.self) { (returnData) in
            self.comicLists =  returnData?.comicLists ?? []
        }
    }
}
