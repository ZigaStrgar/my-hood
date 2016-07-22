//
//  ViewController.swift
//  my-hood
//
//  Created by Ziga Strgar on 08/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // tableView.estimatedRowHeight = 87 Workaround za ono funkcijo spodi
        
        DataService.instance.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: "postsLoaded", object: nil)
        
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }

}
