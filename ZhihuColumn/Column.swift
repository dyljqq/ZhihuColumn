//
//  Column.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation
import SwiftyJSON

//"postsCount" : 23,
//"slug" : "inyourface",
//"avatar" : {
//    "id" : "f77f82e319c6577586ddd4ae0bf04670",
//    "template" : "https:\/\/pic1.zhimg.com\/{id}_{size}.jpg"
//},
//"description" : "脸脸脸！请在我值乎提问哟！https:\/\/www.zhihu.com\/zhi?__pathname__=%2Fzhi%2Fpeople%2F723181812393730048#record-723205686112059392",
//"followersCount" : 5896,
//"name" : "看脸的世界",
//"url" : "\/inyourface"
struct Column {
    
    var postsCount: Int!
    var slug: String!
    var avatar: Avatar!
    var description: String!
    var followersCount: Int!
    var name: String!
    var url: String!
    
    mutating func convert(dic: [String: JSON]) {
        self.postsCount = dic["postsCount"]?.intValue
        self.slug = dic["slug"]?.stringValue
        let d = dic["avatar"]!.dictionaryValue
        avatar = Avatar(id: d["id"]?.stringValue, template: d["template"]?.stringValue)
        self.name = dic["name"]?.stringValue
        self.description = dic["description"]?.stringValue
        self.followersCount = dic["followersCount"]?.intValue
        self.url = dic["url"]?.stringValue
    }
    
}

class ColumnRequest {
    
    static func get(callback: (array: [Column])-> ()) {
        
        Request.get(URLString: URLStrings.column_url, successCallback: { data in
            var array = [Column]()
            for d in data.arrayValue {
                var column = Column()
                column.convert(d.dictionaryValue)
                array.append(column)
            }
            callback(array: array)
        })
        
    }
    
}