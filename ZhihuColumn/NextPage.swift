//
//  NextPage.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation

struct NextPage {
    
    private(set) var hasNext: Bool
    private(set) var isLoading: Bool
    
    init() {
        hasNext = true
        isLoading = false
    }
    
    mutating func reset() {
        hasNext = true
        isLoading = false
    }
    
    mutating func update(hasNext: Bool, isLoading: Bool) {
        self.hasNext = hasNext
        self.isLoading = isLoading
    }
    
}