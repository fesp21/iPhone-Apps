//
//  Person.swift
//  Game_2
//
//  Created by Sandeep on 9/19/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import Foundation
import SpriteKit

enum PersonType:Int,Printable
{
    case Person1 = 0 , Person2, Person3
    
    var description:String
    {
        return "PersonType"
    }
}

class Person:Printable
{
    var description:String
    {
        return "Person"
    }
    
    class func getPeople() -> String[]
    {
        return ["person1'"]
    }
    
    
    
    
    
}