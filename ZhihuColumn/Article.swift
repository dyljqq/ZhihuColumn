//
//  Article.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/13.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    
    var title: String!
    var titleImage: String!
    var name: String!
    var slug: String!
    var author: Author!
    
    mutating func convert(dic: [String: JSON]) {
        
        self.title = dic["title"]?.stringValue
        self.titleImage = dic["titleImage"]?.stringValue
        self.slug = dic["slug"]?.stringValue
        self.name = (dic["column"]!.dictionaryValue)["title"]?.stringValue ?? (dic["column"]!.dictionaryValue)["name"]?.stringValue
        var a = Author()
        a.convert(dic["author"]!.dictionaryValue)
        self.author = a
        
    }
    
}



class ArticleRequest {
    
    class func get(callback: (array: [Article])-> ()) {
        Request.get(URLString: URLStrings.article_url, successCallback: { data in
            var array = [Article]()
            for d in data.arrayValue {
                var article = Article()
                article.convert(d.dictionaryValue)
                array.append(article)
            }
            callback(array: array)
        })
    }
    
}