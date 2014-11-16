//
//  View.swift
//  Interaction
//
//  Created by Sandeep on 9/21/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import Foundation
import UIKit

class Imageview:UIImageView
{
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect , image: UIImage) {
        super.init()
        self.frame = frame
        self.image = image
    }

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)
    {
        var touch:UITouch! = touches.anyObject() as UITouch!
        self.center = touch.locationInView(self.superview)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
