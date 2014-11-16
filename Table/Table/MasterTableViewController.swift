//
//  MasterTableViewController.swift
//  Table
//  Created by Sandeep on 9/20/14.
//
//  Copyright (c) This software shall not be used for evil
//  2014 All rights not reserved.
//

import UIKit

class MasterTableViewController: UITableViewController , UITableViewDataSource ,UITableViewDelegate
{
    
    var todoItems:NSMutableArray = NSMutableArray();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
        
    override func viewDidAppear(animated: Bool)
    {
      
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
  //      println(userDefaults.objectForKey("itemList") as? NSMutableArray)             //DEBUG
        
        if (itemListFromUserDefaults != nil)
        {
            todoItems = itemListFromUserDefaults!
            println("itemListFromUserDefaults")                                //DEBUG
        }
        
        self.tableView.reloadData()
        println("viewDidAppear")                                             //DEBUG
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return todoItems.count
    }
        
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //    println("cellForRowAtIndexPath")                                        //DEBUG
         //   println()                                                               //DEBUG
            //variable type is inferred
            
            var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
            
            if !(cell != nil)
            {
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
            }
        
            var todoItem:NSDictionary = todoItems.objectAtIndex(indexPath.row) as NSDictionary
                
            var titletodoitem = todoItem.objectForKey("Title") as? String
      //      println( "\(titletodoitem )" )                                        //DEBUG
            
            cell?.textLabel?.text = todoItem.objectForKey("Title") as? String
        //    println("            TableView")                                     //DEBUG
            
            return cell!
    }

  
    
    override func prepareForSegue(segue: UIStoryboardSegue? , sender: AnyObject?)
    {
      //  println("prepareForSegue")                                              //DEBUG
        if(segue?.identifier == "showDetail")
        {
            
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var TrashController: TrashViewController = TrashViewController()
            
            TrashController = segue?.destinationViewController as TrashViewController
            TrashController.toDOData = todoItems.objectAtIndex(selectedIndexPath.row) as NSDictionary
            TrashController.index = Int32 (selectedIndexPath.row)
            
            
            
            
       //     println("if(segue!.identifier")                                    //DEBUG
            
        }
        
        
        
        
    //    println(" after  if(segue!.identifier == showDetail) ")                //DEBUG
        
        //After doing this make sure that which ever view that your are segeuing to has no error ...
    }


}