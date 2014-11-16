//
//  ViewController.swift
//  Notification_Apps
//
//  Created by Sandeep on 9/21/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificatonsOne:", name: "Action 1 pressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificatonsTwo:", name: "Action 2 pressed", object: nil)
        

        
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2014
        dateComp.month = 09
        dateComp.day = 22
        dateComp.hour = 8
        dateComp.minute = 32
        
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calender:NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        var date:NSDate = calender.dateFromComponents(dateComp)!
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "HI"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)

        
        
    }
    
    func notificatonsOne(notification:NSNotification)
    {
        var view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
    }
    
    
    func notificatonsTwo(notification:NSNotification)
    {
        var message:UIAlertController = UIAlertController(title: "Notification", message: "Hello", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
    }



    



    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

