//
//  Request.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

typealias SuccessCallback = (data: JSON)-> ()
typealias FailureCallback = (error: NSError)-> ()

class Request {
    class func get(URLString URLString: String,
                             parameters: [[String: AnyObject]]? = nil,
                             successCallback: SuccessCallback,
                             failureCallback: FailureCallback? = nil) {
        print("URLString: \(URLString)\nparameters: \(parameters)")
        Alamofire.request(.GET, URLString).responseJSON { response in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                print("response value: \(json)")
                successCallback(data: json)
            case .Failure(let error):
                print("Network error: \(error)")
                if let failureCallback = failureCallback {
                    failureCallback(error: error)
                }
            }
        }
    }
}

