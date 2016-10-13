//
//  URLS.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation

private let initial_prefix = "https://zhuanlan.zhihu.com/"
private let prefix = "https://zhuanlan.zhihu.com/api/"
private let recommendations = "recommendations/"
private let columns = "columns/"
private let p = "p/"

//http://zhuanlan.zhihu.com/api/columns/{{%UID}}/posts?limit={{%LIMIT}}&offset={{%OFFSET}}

struct URLStrings {
    
    // 专栏发现
    static let column_url = prefix + recommendations + "columns?limit=16&offset=0&seed=74"
    
    // 文章发现
    static let article_url = prefix + recommendations + "posts?limit=12&offset=0&seed=74"
    
    // 启动图片
    static let start_image_url = "http://news-at.zhihu.com/api/4/" + "start-image/\(Int(resolutionRate.width))*\(Int(resolutionRate.height))"
    
    // 个人专栏
    static func getPersonalColumns(name: String)-> String {
        return prefix + columns + name
    }
    
    // 专栏文章信息
    static func getColumnArticleInfo(uid: String)-> String {
        return prefix + columns + uid + "/posts?limit=16&offset=0"
    }
    
    static func getWebViewURLString(suffix: String)-> String {
        return "https://zhuanlan.zhihu.com/" + suffix
    }
    
    // 用户专栏入口
    static func getPeopleInfo(suffix: String)-> String {
        return "http://www.zhihu.com/people/" + suffix + "/posts"
    }
    
    // 文章详情
    static func getArticleDetail(slug: String)-> String {
        return initial_prefix + p + slug
    }
    
}