//
//  TableViewTableViewController.swift
//  Swiffer
//
//  Created by Sandeep on 9/22/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    var timeLineData :NSMutableArray = NSMutableArray()
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewStyle)
    {
        super.init(style:style)
    }
    
    //MARK: -LOAD-DATA
     func loadData()
    {
        
        timeLineData.removeAllObjects()
        
        var findTimelineData:PFQuery = PFQuery(className:"storedText")
        
        
        var objects = [AnyObject]()
        
        findTimelineData.findObjectsInBackgroundWithBlock(
        {
            (objects , error:NSError!) -> Void in
                
            if error == nil
            {
                for object in objects
                {
                    self.timeLineData.addObject(object)
                }
                
                let array:NSArray =  self.timeLineData.reverseObjectEnumerator().allObjects  //For sorting by date
                
                self.timeLineData = NSMutableArray(array: array)
                
                
                //  tableData = array as NSMutableArray
                
                self.tableView.reloadData()
                
            }
        
        
        })
        
    }
    
    
    
    @IBAction func logOut()
    {
        PFUser.logOut()
        loginDelegate()
        
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        

        
        
    }
    
    @IBAction func refreshView()
    {
        viewDidAppear(true)
    }
    
    func loginDelegate() // TO ensure corret LOGINS
    {
        
        var current = PFUser.currentUser()
        
        if ((current) == nil)
        {
            var loginAlert:UIAlertController = UIAlertController(title: "Sign Up / log in", message: "sign up / log in '", preferredStyle: UIAlertControllerStyle.Alert)
            
            loginAlert.addTextFieldWithConfigurationHandler(
                {
                    textfield in
                    textfield.placeholder = "Your username"
                    
            })
            loginAlert.addTextFieldWithConfigurationHandler(
                {
                    textfield in
                    textfield.placeholder = "Password"
                    textfield.secureTextEntry = true
            })
            loginAlert.addAction(UIAlertAction(title: "Login", style: UIAlertActionStyle.Default, handler: (
                { alertAction in
                    let textFeilds:NSArray = loginAlert.textFields! as NSArray
                    let usernameFeild:UITextField = textFeilds.objectAtIndex(0) as UITextField
                    let passwordFeild:UITextField = textFeilds.objectAtIndex(1) as UITextField
                    
                    PFUser.logInWithUsernameInBackground(usernameFeild.text, password: passwordFeild.text)
                        {
                            (user:PFUser!,error:NSError!) -> Void in
                            if((user) != nil)
                            {
                                println("User LOgin in")
                            }
                            else
                            {
                                println("Login Failed")
                                self.refreshView()
                            }
                            
                    }
            })))
            
            
            loginAlert.addAction(UIAlertAction(title: "SignUp", style: UIAlertActionStyle.Default, handler: (
                { alertAction in
                    let textFeilds:NSArray = loginAlert.textFields! as NSArray
                    let usernameFeild:UITextField = textFeilds.objectAtIndex(0) as UITextField
                    let passwordFeild:UITextField = textFeilds.objectAtIndex(1) as UITextField
                    
                    var user:PFUser = PFUser()
                    user.username = usernameFeild.text
                    user.password = passwordFeild.text
                    
                    user.signUpInBackgroundWithBlock
                        {
                            (success:Bool! , error:NSError!)-> Void in
                            if error == nil
                            {
                                println("SIGN UP SUCCESS")
                                
                            }
                            else
                            {
                                println("errorStr")
                                self.refreshView()
                            }
                            
                            
                    }
                    
            })))
            self.presentViewController(loginAlert, animated: true, completion: nil)
            // println("  self.presentViewController(loginAlert, animated: true, completion: nil)")                        //DEBUG
            
        }
    }
     override func viewDidAppear(animated: Bool)
    {
        
        self.loadData()
        
        //MARK: -LOGOUT-FOOTER-BUTTON
        var footView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        self.tableView.tableFooterView = footView
        var DummyButton:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        DummyButton.frame = CGRectMake(self.view.frame.size.width / 2 - 50, 10, 100, 20)
        DummyButton.setTitle("LogOut", forState: UIControlState.Normal)
        DummyButton.addTarget(self, action: "logOut", forControlEvents: UIControlEvents.TouchUpInside)
        footView.addSubview(DummyButton)
        
        loginDelegate()
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return timeLineData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        //Initilizing the TableViewCell class as Cell
        let cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TableViewCell

        //Ensuring that different rows corresnpond to different sweets
        let sweet:PFObject = self.timeLineData.objectAtIndex(indexPath.row)
         as PFObject
        
        //Animation for the cell Appearing
        cell.textView?.alpha = 0
        cell.time?.alpha = 0
        cell.imageBox?.alpha = 0
        cell.userName?.alpha = 0
        
        
            // Converting the string from Parse for createdAt into a date
         var dateFormatter:NSDateFormatter = NSDateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        
            // Storing image in the cell's Image View
        
         //   cell.imageBox?.image = sweet.objectForKey("image") as? UIImage
        
        
        
        //MARK: FETCH-FROM-PARSE
        // Fetching the data stored in parse into phone memory
        sweet.fetchInBackgroundWithBlock
        {
            ( data:PFObject!, error:NSError!) -> Void in
            if error == nil
                {
                cell.textView?.text = data["content"] as String
                cell.time!.text = dateFormatter.stringFromDate(data.createdAt)
                    
                let imageFile = data["image"] as PFFile
                
                    imageFile.getDataInBackgroundWithBlock(
                        { (imageData:NSData!, error:NSError!) -> Void in
                            if error == nil
                            {
                                let image:UIImage = UIImage(data: imageData)
                                cell.imageBox?.image = image
                                println("Image Retrival Success !! ")           //DEBUG
                            }
                        
                        
                    
                        })
                
                
                    
                    
                    
                }
        }
        
        
        
        
        
        
            //MARK: -Query
        var findUser:PFQuery = PFUser.query()
        findUser.whereKey("objectId", equalTo: sweet.objectForKey("user").objectId)
            
        findUser.findObjectsInBackgroundWithBlock(
        {
        
        (objects:[AnyObject]! , error:NSError!) -> Void in
            if (error == nil)
            {
              let user:PFUser = (objects as NSArray).lastObject as PFUser
              cell.userName!.text = user.username
              
        
            }
            
                //MARK: Cell-Appear-Animation
            UIView.animateWithDuration(0.3, animations:
                { () -> Void in
                    cell.textView?.alpha = 1
                    cell.userName?.alpha = 1
                    cell.time?.alpha = 1
                    cell.imageBox?.alpha = 1
                })
            
            
        })
        
        
        return cell
    }
    


}
