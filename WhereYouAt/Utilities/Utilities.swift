//
//  Utilities.swift
//  WhereYouAt
//
//  Created by Ranjith on 16/10/15.
//  Copyright © 2015 iranjith4. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    //Custom Function to calculate the UIcolor so easily
    class func giveMeColorForRGB(red:CGFloat, green : CGFloat, blue: CGFloat ) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
}
