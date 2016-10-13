//
//  MainWebViewController.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class MainWebViewController: UIViewController {
    
    var name = ""
    var URLString = "" {
        didSet {
            guard let url = NSURL(string: URLString) else {
                print("url is not valid")
                return
            }
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
    }
    
    lazy var webView: UIWebView = {
        let webView = UIWebView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height))
        webView.backgroundColor = whiteColor
        webView.delegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.title = name
        self.view.addSubview(self.webView)
    }
    
    
}

extension MainWebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}