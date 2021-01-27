//
//  UModel.swift
//  dmzj
//
//  Created by luxiao on 2020/12/3.
//

import Foundation
import HandyJSON


extension Array: HandyJSON{}

struct ReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}

struct ResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: ReturnData<T>?
}

struct BoutiqueListNew : HandyJSON {
    var comicLists : [ComicList]?
    var galleryItems: [GalleryItem]?
}

struct GalleryItem {
    var cover: String?
    var title: String?
    var sub_title: String?
    var url: String?
}

struct ComicList : HandyJSON {
    var comics : [Comic]?
    var comicType: Int = 0
    var canedit: Int = 0
    var sortId: String?
    var titleIconUrl: String?
    var newTitleIconUrl: String?
    var description: String?
    var itemTitle: String?
    var argName: String?
    var argValue: String?
    var argType: String?
}

struct Comic : HandyJSON {
    var name: String?
    var cover: String?
    var subTitle: String?
    var description: String?
    var cornerInfo: String?
    var short_description: String?
    var author_name: String?
    var is_vip: String?
    var tags : [String]?
}
