//
//  TableViewController.swift
//  AOP
//
//  Created by cjfire on 16/9/26.
//  Copyright © 2016年 cjfire. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataSource = [String]()
    var shouldSleep = false
    lazy var tableViewProxy: TableViewProxy = TableViewProxy(target: self.tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<20 {
            dataSource.append("\(i)")
        }
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.classForCoder())")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(TableViewController.rightBtnDidClicked(_:)))
    }

    @objc private func rightBtnDidClicked(sender: UIBarButtonItem) {
        shouldSleep = true
        self.tableViewProxy.performSelector(#selector(tableView.reloadData))
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if shouldSleep {
        
            NSThread.sleepForTimeInterval(2)
            print("\(self.classForCoder) 调用完毕")
        }
        
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("\(UITableViewCell.classForCoder())", forIndexPath: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}
