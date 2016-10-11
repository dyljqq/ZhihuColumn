//
//  ReloadType.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

protocol ReloadableType {
    func dj_reloadData()
}

extension UIView: ReloadableType {
    func dj_reloadData() {
        
        if let view = self as? UITableView {
            view.reloadData()
            return
        } else if let view = self as? UICollectionView {
            view.reloadData()
            return
        }
        
        for subview in subviews {
            if let subview = subview as? UITableView  {
                subview.reloadData()
                break
            }
        }
    }
}