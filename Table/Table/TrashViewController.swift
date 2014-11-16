//
//  TrashViewController.swift
//  Table
//
//  Created by Sandeep on 9/20/14.
//
//  Copyright (c) This software shall not be used for evil
//  2014 All rights not reserved.
//

import UIKit

class TrashViewController: UIViewController {

    @IBOutlet weak var titleTextFeild: UITextField? = UITextField()
    @IBOutlet weak var notesTextFeild: UITextView? = UITextView()
    
    var toDOData:NSDictionary = NSDictionary()
    var index  :Int32 = 0
    
    override func viewDidLoad()
    {
        println("viewDidLoad() TrashViewController ")                           //DEBUG
        super.viewDidLoad()

        titleTextFeild?.userInteractionEnabled = false
        notesTextFeild?.userInteractionEnabled = false
        
        titleTextFeild?.text? = toDOData.objectForKey("Title") as String
        notesTextFeild?.text? = toDOData.objectForKey("Notes") as
            String
         println("viewDidLoad() TrashViewController ")                          //DEBUG
    }


    
    
    @IBAction func deleteItem(sender: AnyObject)
    {
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        var newMutableArray:NSMutableArray? = NSMutableArray()
        
        for dict:AnyObject in itemList!
        {
            newMutableArray?.addObject(dict)
        }

        
        newMutableArray?.removeObject(toDOData)
        userDefaults.removeObjectForKey("itemList")
        
        userDefaults.setObject(newMutableArray, forKey: "itemList")
        
   
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
        /*
    {
        
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        let currentItemTitle :String! = toDOData.objectForKey("Title") as String
        println("currentItemTitle")                                                     //DEBUG
        println(currentItemTitle)                                                       //DEBUG
        var item:NSDictionary = NSDictionary()
        println(itemList!)                                                              //DEBUG
        for item in itemList!
        {
            var itemTitle :String! = item.objectForKey("Title") as String!
             
           println(itemTitle)                                                           //DEBUG
           //println(currentItemTitle)                                                  //DEBUG
            
            //If the item I am now in possesion of in the for loop is equal to the title with which the segue was celled then we delete that item and replace the userDefault with the new mutable array from which the item ws deleted ....
            
            
           if itemTitle == currentItemTitle
           {
                itemList?.removeObject(item)
           }
           // println(itemList!)                                                       //DEBUG
           //   println("     ")                                                       //DEBUG
        }
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(itemList, forKey: "itemList")
        
        userDefaults.synchronize()
        
        println(" deleteItem(sender: AnyObject)")                                       //DEBUG
        
        
      //  [self performSegueWithIdentifier:@"backButtonMagic" sender:sender ];
   //     self.performSegueWithIdentifier("fromTrash", sender: sender)
        
   //     MyNewViewController *myNewVC = [[MyNewViewController alloc] init];
        
        // do any setup you need for myNewVC
      //   self.presentViewController(MasterTableViewController, animated: true, completion: {})
    //    [self presentModalViewController:myNewVC animated:YES];
        
    }*/
  
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
