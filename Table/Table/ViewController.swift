//
//  ViewController.swift
//  Table
//  Created by Sandeep on 9/20/14.
//
//  Copyright (c) This software shall not be used for evil
//  2014 All rights not reserved.
//


import UIKit

class ViewController: UIViewController {

    
    // Outlets
    
    @IBOutlet weak var titleTextFeild: UITextField? = UITextField()
    @IBOutlet weak var NotesTextFeild: UITextView? = UITextView()
    
    
    //Actions
    
    
    @IBAction func clickedDone(sender: AnyObject)
    {
        //DATA TRANSFER
        
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject((titleTextFeild?.text)!  , forKey: "Title")
        dataSet.setObject((NotesTextFeild?.text)!, forKey: "Notes")
        
    //    println((dataSet["Title"])!)                                                          //DEBUG
   //     println((dataSet["Notes"])!)                                                          //DEBUG
        
        
   //     println((titleTextFeild?.text)!)                                                      //DEBUG
   
  //      println((NotesTextFeild?.text)! )                                                     //DEBUG
        
        
        
        if ((itemList) != nil)
        {
            var newMutableList:NSMutableArray = NSMutableArray();
            
            for dict:AnyObject in itemList!
            {
                newMutableList.addObject(dict as NSDictionary)
            }
            userDefaults.removeObjectForKey("itemList")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "itemList")
         //   println("if ((itemList) != nil)")                                                 //DEBUG
        }else{
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
        //    println("}else{")                                                                 //DEBUG
        }
       // println("\(dataSet.))
        userDefaults.synchronize()    
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
     //   println("Done Clicked")                                                               //DEBUG
    }
    
    
 /*   override func touchesBegan( touches :NSSet , withEvent event: UIEvent )
    {
        for touch in touches
        {
            if ((touch.touchesForView(NotesTextFeild!)) != nil)
            {
                NotesTextFeild?.text = ""
                
            }
        }
        println("touchesBegan")
        
    }*/

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  println(" viewDidLoad() ")                                                            //DEBUG
      //   Inorder to ensure that on touching the entered text is removed .. 
        
        var tapNotes:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tappedNotes:")
        
        tapNotes.numberOfTapsRequired = 1
        self.NotesTextFeild?.addGestureRecognizer(tapNotes)
        
        var tapItem:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tappedItem:")
        
        tapItem.numberOfTapsRequired = 1
        self.titleTextFeild?.addGestureRecognizer(tapItem)
        

        
       
    }
    func tappedItem(tapItem :UIGestureRecognizer)
    {
        self.titleTextFeild?.text = ""
        
        println(tappedItem)                                                         //DEBUG
    }
    
    func tappedNotes(tapNotes :UIGestureRecognizer )
    {
        if NotesTextFeild?.text == "Add your Notes here... "
        {
        self.NotesTextFeild?.text = ""
        }
        self.NotesTextFeild?.becomeFirstResponder()
        println("tappedNotes")                                                       //DEBUG
        
    }
 

    
     override func viewDidAppear(animated: Bool) {
        
    }
    
    
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
