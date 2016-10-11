//
//  URLS.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation

private let prefix = "https://zhuanlan.zhihu.com/api/recommendations/"

struct URLStrings {
    
    // 专栏发现
    static let column_url = prefix + "columns?limit=16&offset=0&seed=74"
    
    // 文章发现
    static let article_url = prefix + "posts?limit=12&offset=0&seed=74"
    
}