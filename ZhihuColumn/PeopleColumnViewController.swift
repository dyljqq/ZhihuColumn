//
//  PeopleColumnViewController.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class PeopleColumnViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "用户专栏"
        
        Request.get(URLString: URLStrings.getPeopleInfo("jixin"), successCallback: { data in
            
        })
        
    }
    
}
