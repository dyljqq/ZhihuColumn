//
//  Author.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/13.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Author {
    
    var name: String!
    var profileUrl: String!
    var bio: String!
    var uid: String!
    var slug: String!
    var avatar: Avatar!
    var description: String!
    
    mutating func convert(dic: [String: JSON]) {
        
        self.name = dic["name"]?.stringValue
        self.profileUrl = dic["profileUrl"]?.stringValue
        self.bio = dic["bio"]?.stringValue
        self.uid = dic["uid"]?.stringValue
        self.slug = dic["slug"]?.stringValue
        let d = dic["avatar"]!.dictionaryValue
        self.avatar = Avatar(id: d["id"]?.stringValue, template: d["template"]?.stringValue, URLString: String("https://pic1.zhimg.com/\((d["id"]?.stringValue)!)_xl.jpg"))
        self.description = dic["description"]?.stringValue
        
    }
    
}