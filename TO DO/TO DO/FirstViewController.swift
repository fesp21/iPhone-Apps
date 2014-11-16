//
//  FirstViewController.swift
//  TO DO
//
//  Created by Sandeep on 9/19/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {

    
    
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return 5

    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
      
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        cell.textLabel?.text = "hi"
            
            //taskMgr.tasks[indexPath.row].name
        cell.textLabel?.textColor = UIColor.blueColor()

        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
        
    }
    
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

