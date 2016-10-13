//
//  PersonalColumn.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PersonalColumn {
    var titleImage: String!
    var title: String!
    var content: String!
    var likesCount: Int!
    var commentsCount: Int!
    var name: String!
    var publishedTime: String!
    var url: String!
    
    mutating func convert(dic: [String: JSON]) {
        self.titleImage = dic["titleImage"]?.stringValue ?? ""
        self.title = dic["title"]?.stringValue ?? ""
        self.content = dic["content"]?.stringValue ?? ""
        self.likesCount = dic["likesCount"]?.intValue ?? 0
        self.commentsCount = dic["commentsCount"]?.intValue ?? 0
        self.name = dic["name"]?.stringValue ?? ""
        self.publishedTime = dic["publishedTime"]?.stringValue ?? ""
        self.url = dic["url"]?.stringValue ?? ""
    }
    
}

class PersonalColumnRequest {
    
    static func get(name: String, callback: (array: [PersonalColumn])-> ()) {
        
        Request.get(URLString: URLStrings.getColumnArticleInfo(name), successCallback: { data in
            var array = [PersonalColumn]()
            for dic in data.arrayValue {
                var personalColumn = PersonalColumn()
                personalColumn.convert(dic.dictionaryValue)
                array.append(personalColumn)
            }
            callback(array: array)
        })
        
    }
    
}
