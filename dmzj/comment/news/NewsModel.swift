//
//  BoutiqueListNewViewModel.swift
//  dmzj
//
//  Created by luxiao on 2021/2/3.
//

import Foundation

class NewsModel: ObservableObject {
    
    @Published var rankingList = [RankingModel]()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        //请求排行列表
        Api.request(.mobileCateList, model: CateListModel.self) { (returnData) in
            self.rankingList =  returnData?.rankingList ?? []
        }
    }
}
