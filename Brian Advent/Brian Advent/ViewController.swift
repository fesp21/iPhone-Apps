//
//  ViewController.swift
//  Brian Advent
//
//  Created by Sandeep on 9/20/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
  
    var  imageView:UIImageView = UIImageView()
    var  Dict:Dictionary<String,String> = Dictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
    
        let width:CGFloat = 320 ;
        let height:CGFloat = 568
        
        Dict = ["Image 1":"Image1" , "Image 2":"Image2"]
        
        var buttonTitles = ["Image 1","Image 2"]
        
        var view:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        self.view.addSubview(view)
        println(Dict.count)
        
        var Image:UIImage = UIImage(named: "Image2")
        println(Image.description)
        imageView = UIImageView(frame: view.frame)
        imageView.image = Image
        view.addSubview(imageView)
        
        
        for i in 0 ... buttonTitles.count-1
        {
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(0, 0, 200, 20)
            
            button.center = CGPointMake((view.center.x), CGFloat(100 + i*50))
            
            button.setTitle(buttonTitles[i], forState: UIControlState.Normal)
            
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "Clicked:", forControlEvents: UIControlEvents.TouchUpInside)

            button.tag = i+1
            
            view.addSubview(button)
        }
   
    }

    func Clicked(sender:UIButton)
    {
        var button:UIButton = sender
        
        var imageSelector:String = "Image \(button.tag)"
        var imageFromDict:UIImage = UIImage(named: Dict[imageSelector]!)
        
        UIView.animateWithDuration(0.4, animations: {self.imageView.alpha = 0 }, completion: {_ in self.imageView.image = UIImage(named: self.Dict[imageSelector]!)
            UIView.animateWithDuration(0.4, animations: {self.imageView.alpha = 1})
            })
            
        imageView.image = imageFromDict
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

