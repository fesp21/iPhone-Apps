//
//  ViewController.swift
//  Demo
//
//  Created by Sandeep on 9/20/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{
    //VARIABLES

    
    //Outlets
    @IBOutlet weak var tableView: UITableView? = UITableView()
   
    
    //Data
    let userDefaults :NSUserDefaults = NSUserDefaults()
    let storageArray = NSMutableArray()
    let headerView = UIView()
    var textBox = UITextField(frame: CGRectMake(0, 0, 150 , 45))
    
    //let storageDict = NSMutableDictionary()
    
    
    
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        textBox.delegate = self
        
        headerView.frame = CGRectMake(0, 0, 320, 200)
        headerView.backgroundColor = UIColor.blueColor()
        
        tableView?.tableHeaderView = headerView
        
        
        textBox.center = headerView.center
        textBox.placeholder = "Enter Item Here"
        
        textBox.font = UIFont.boldSystemFontOfSize(12)
        textBox.backgroundColor = UIColor.yellowColor()
        textBox.textAlignment = NSTextAlignment.Center
        
        
        
        headerView.addSubview(textBox)
        tableView?.reloadData()
        
 //       textBox?.text = "DoReMe"                                  //DEBUG
 //       Image?.backgroundColor = UIColor.blueColor()              //DEBUG
        
        
    }//viewDidLoad()
    
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Not being called
        println("tableView")                                                           //DEBUG
        
        let cellIdentifier = "reuseCell"
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier )
        
        cell.textLabel?.text = " Hello \((storageArray.objectAtIndex(indexPath.row)))  "
        println(storageArray)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
     //   println("tableView")
        return storageArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
       // var alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let alert = UIAlertView()
        alert.title = "Hey"
        alert.message = "This is  one Alert"
        alert.addButtonWithTitle("Working!!")
        alert.show()
        
      //  alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler:nil ))
       // self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textBox.resignFirstResponder()
//        println("Return Pressed ")                                                            //DEBUG
        if textBox.text != nil
        {
        storageArray.addObject(textBox.text)
        println(" if textBox.text != nil ")                                         //DEBUG
        }
        
        tableView?.reloadData()
        textBox.text = ""
        return true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    
}

