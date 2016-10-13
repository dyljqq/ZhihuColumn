//
//  ViewController.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/11.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectMake(0, navigationBarHeight, screenSize.width, screenSize.height - navigationBarHeight))
        tableView.registerClass(ColumnCell.self, forCellReuseIdentifier: CellReuse.cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        tableView.hidden = true
        return tableView
    }()
    
    let launch = LauchViewController()
    
    // load next
    var data: [Column] = [Column]()
    var nextPageState: NextPage = NextPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
        self.view.backgroundColor = appBackgroundColor
        navigationController?.navigationBar.tintColor = whiteColor
        navigationController?.navigationBar.barTintColor = navigationColor //颜色
        // nice
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.hidden = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "article"), style: .Plain, target: self, action: #selector(articleAction))
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.translucent = true
        
        self.view.addSubview(self.tableView)
        loadNext(tableView)
        
        addChildViewController(launch)
        launch.view.alpha = 0.99
        view.addSubview(launch.view)
        
    }
    
    func articleAction() {
        
        navigationController?.pushViewController(ArticleListViewController(), animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - tableView delegate

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuse.cell, forIndexPath: indexPath) as! ColumnCell
        cell.column = data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.fd_heightForCellWithIdentifier(CellReuse.cell) { cell in
            (cell as! ColumnCell).column = self.data[indexPath.row]
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let pushController = PersonalColumnViewController()
        pushController.tuple = (title: data[indexPath.row].name, name: data[indexPath.row].slug)
        navigationController?.pushViewController(pushController, animated: true)
        
    }
    
}

// MARK: - load next delegate

extension ViewController: LoadNext {
    
    func performLoad(successHandler: (rows: [Column], hasNext: Bool) -> (), failHandler: () -> ()) {
        ColumnRequest.get { array in
            self.showTableView()
            successHandler(rows: array, hasNext: true)
        }
    }
    
}

// MARK: - private method
extension ViewController {
    
    private func showTableView() {
        let lauchImageView = self.launch.view
        UIView.animateWithDuration(2.5, animations: {
            
            lauchImageView.alpha = 1.0
            
            }, completion: { stop in
                UIView.animateWithDuration(0.2, animations: {
                    
                    lauchImageView.alpha = 0.0
                    
                }) { finished in
                    lauchImageView.removeFromSuperview()
                    self.tableView.hidden = false
                    self.navigationController?.navigationBar.hidden = false
                }
        })
    }
    
}

