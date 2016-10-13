//
//  ArticleListViewController.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/13.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height))
        tableView.registerClass(ArticleCell.self, forCellReuseIdentifier: CellReuse.cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // load next
    var data = [Article]()
    var nextPageState: NextPage = NextPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "文章列表"
        view.backgroundColor = appBackgroundColor
        view.addSubview(self.tableView)
        
        loadNext(tableView)
        
    }
    
}

// MARK: - UITableView Delegate

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.fd_heightForCellWithIdentifier(CellReuse.cell) { cell in
            (cell as! ArticleCell).article = self.data[indexPath.row]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuse.cell, forIndexPath: indexPath) as! ArticleCell
        cell.article = data[indexPath.row]
        return cell
    }
    
}

extension ArticleListViewController: UITableViewDelegate {
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let web = MainWebViewController()
        web.URLString = URLStrings.getArticleDetail(data[indexPath.row].slug)
        web.name = data[indexPath.row].title
        navigationController?.pushViewController(web, animated: true)
        
    }
    
}

// MARK: - load next

extension ArticleListViewController: LoadNext {
    
    func performLoad(successHandler: (rows: [Article], hasNext: Bool) -> (), failHandler: () -> ()) {
        ArticleRequest.get { articles in
            successHandler(rows: articles, hasNext: true)
        }
    }
    
}


// MARK: - private method

extension ArticleListViewController {
    
}
