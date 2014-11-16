//
//  ViewController.swift
//  Interaction
//
//  Created by Sandeep on 9/21/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var image:UIImage!
    var imageView:Imageview!
    
    
    
    @IBAction func buttonTapped(button :UIButton)
    {
        image = UIImage(named: (button.titleLabel?.text! as String!))
        println((button.titleLabel?.text! as String!))                   //DEBUG
        var frame:CGRect = CGRectMake(100 , 100, 120, 230)
        imageView = Imageview(frame: frame, image: image)
        imageView.userInteractionEnabled = true
        
        self.view.addSubview(imageView)
        
        
        
    }
    

}

