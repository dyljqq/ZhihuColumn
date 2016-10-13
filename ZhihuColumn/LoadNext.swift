//
//  Protocol.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation

protocol LoadNext: class {
    
    associatedtype DataType
    
    var data: [DataType] { get set }
    var nextPageState: NextPage { get set }
    
    func performLoad(successHandler: (rows: [DataType], hasNext: Bool)-> (),
                     failHandler: ()-> ())
    
}

extension LoadNext {
    
    func loadNext(view: ReloadableType) {
        guard nextPageState.hasNext else { print("No next data..."); return }
        guard !nextPageState.isLoading else { print("is loading..."); return }
        
        nextPageState.update(nextPageState.hasNext, isLoading: true)
        
        performLoad({ rows, hasNext in
            self.data += rows
            self.nextPageState.update(hasNext, isLoading: false)
            view.dj_reloadData()
        }, failHandler: { error in
            print("Error: \(error)")
        })
    }
    
}