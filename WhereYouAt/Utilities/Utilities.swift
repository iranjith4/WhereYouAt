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
    
    //MARK: Size Resize
    
    //The Base device set is iPhone 6.
    class func heightRatioTobaseDevice() -> CGFloat{
        let baseDeviceHeight = CGFloat(667)
        let height = UIScreen.mainScreen().bounds.height
        return height / baseDeviceHeight
    }
    
    class func logInLineHeight() -> CGFloat {
        return 2
    }
    
    class func logInElementsSpace() -> CGFloat {
        return 0.15
    }
    
    class func logInElementsWidth() -> CGFloat {
        return 0.70
    }
    
}
