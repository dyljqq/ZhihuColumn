//
//  PersonalColumnViewController.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class PersonalColumnViewController: UIViewController {
    
    var tuple: (title: String, name: String) = ("", "") {
        didSet {
            title = "\(tuple.title)的知乎专栏"
            loadNext(tablewView)
        }
    }
    
    // load next
    var data = [PersonalColumn]()
    var nextPageState: NextPage = NextPage()
    
    lazy var tablewView: UITableView = {
        let tableView = UITableView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height), style: .Grouped)
        tableView.registerClass(PersonalColumnCell.self, forCellReuseIdentifier: CellReuse.cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackgroundColor
        view.addSubview(self.tablewView)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: nil, action: nil)
    }
    
}

// MARK: - tableView delegate

extension PersonalColumnViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuse.cell, forIndexPath: indexPath) as! PersonalColumnCell
        cell.personalColumn = data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.fd_heightForCellWithIdentifier(CellReuse.cell) { cell in
            (cell as! PersonalColumnCell).personalColumn = self.data[indexPath.row]
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}

extension PersonalColumnViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let web = MainWebViewController()
        web.URLString = URLStrings.getWebViewURLString(data[indexPath.row].url)
        web.name = tuple.title
        navigationController?.pushViewController(web, animated: true)
        
    }
    
}


extension PersonalColumnViewController: LoadNext {
    
    func performLoad(successHandler: (rows: [PersonalColumn], hasNext: Bool) -> (), failHandler: () -> ()) {
        PersonalColumnRequest.get(tuple.name) { array in
            successHandler(rows: array, hasNext: true)
        }
    }
    
}
