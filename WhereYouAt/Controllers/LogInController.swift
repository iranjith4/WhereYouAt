//
//  LogInController.swift
//  WhereYouAt
//
//  Created by Ranjith on 17/10/15.
//  Copyright © 2015 iranjith4. All rights reserved.
//

import UIKit

class LogInController: UIViewController {
    
    var xPos : CGFloat?
    var yPos : CGFloat?
    var userName : FloatLabelTextField?
    var passWord : FloatLabelTextField?


    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    func initSetup(){
        xPos = 0
        yPos = 0
        self.view.backgroundColor = UIColor.whiteColor()
        loadLabels()
    }
    
    func loadLabels(){
        
        yPos = yPos! + self.view.frame.size.height * 0.20
        
        //User Name Text Field
        userName = FloatLabelTextField(frame: CGRectMake(self.view.frame.size.width * 0.17, yPos!, self.view.frame.size.width * 0.70, 40))
        userName!.placeholder = "User Name"
        userName!.attributedPlaceholder = NSAttributedString(string:userName!.placeholder!,attributes: [NSForegroundColorAttributeName: UIColor.blackColor()])
        userName!.textColor = UIColor.orangeColor()
        userName!.titleTextColour = UIColor.grayColor()
        userName!.titleActiveTextColour = UIColor.blackColor()
        userName!.font = UIFont.systemFontOfSize(20)
        userName?.autocorrectionType = UITextAutocorrectionType.No
        self.view.addSubview(userName!)
        yPos = yPos! + userName!.frame.size.height
        addALine()
        
        yPos = yPos! + self.view.frame.size.height * 0.03 * Utilities.heightRatioTobaseDevice()
        
        //Password Text Field
        passWord = FloatLabelTextField(frame: CGRectMake(self.view.frame.size.width * 0.17, yPos!, self.view.frame.size.width * 0.70, 40))
        passWord!.placeholder = "Password"
        passWord!.attributedPlaceholder = NSAttributedString(string:passWord!.placeholder!,attributes: [NSForegroundColorAttributeName: UIColor.blackColor()])
        passWord!.textColor = UIColor.orangeColor()
        passWord!.titleTextColour = UIColor.grayColor()
        passWord!.titleActiveTextColour = UIColor.blackColor()
        passWord!.secureTextEntry = true
        passWord!.font = UIFont.systemFontOfSize(20)
        passWord?.autocorrectionType = UITextAutocorrectionType.No
        self.view.addSubview(passWord!)
        yPos = yPos! + passWord!.frame.size.height
        addALine()
        
        yPos = yPos! + self.view.frame.size.height * 0.05 * Utilities.heightRatioTobaseDevice()
        
        
        let logInButton = UIButton()
        logInButton.frame = CGRectMake(0, yPos!, self.view.frame.size.width * 0.50, 50)
        logInButton.setTitle("Log In", forState: UIControlState.Normal)
        logInButton.center = CGPointMake(self.view.center.x, logInButton.center.y)
        logInButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        logInButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        logInButton.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        logInButton.backgroundColor = UIColor.grayColor()
        logInButton.layer.cornerRadius = 10.0
        logInButton.addTarget(self, action:Selector("loginTapped"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(logInButton)
        yPos = yPos! + self.view.frame.size.height * 0.18 * Utilities.heightRatioTobaseDevice()
    }
    
    //MARK: UI Elements
    
    func addALine(){
        let line = UIView.init(frame: CGRectMake(self.view.frame.size.width * Utilities.logInElementsSpace(), yPos!, self.view.frame.size.width * Utilities.logInElementsWidth(), Utilities.logInLineHeight()))
        line.backgroundColor = UIColor.blackColor()
        self.view.addSubview(line)
        yPos = yPos! + Utilities.logInLineHeight()
    }
    
    func loginTapped(){
        print("Login tapped")
        let user_username:String = (userName?.text)!
        let user_password:String = (passWord?.text)!
        let headers: Dictionary = ["X-Apple-Device-Id": UIDevice.currentDevice().identifierForVendor!.UUIDString]
        let params: Dictionary = ["user_username": user_username, "user_password": user_password]
        let WYA: WhereYouAt = WhereYouAt()
        
        WYA.User.login(params, headers: headers){ (response) -> Void in
            let success = response["success"] as! Bool
            dispatch_async(dispatch_get_main_queue()) {
                if (success){
                    let userTest: NSDictionary? = response["user"] as! NSDictionary!
                    if userTest != nil {
                        // knowing it will cast as a dictionary, we cast it again as a traversable dictionary (the optional type is not traversable)
                        let user: NSDictionary = response["user"] as! NSDictionary!
                        for (key, value) in user {
                            // this is the absolute safest way to check for a parameter
                            if key as! String == "user_display_name" {
                                print(value as! String)
                            }
                        }
                    }
                } else {
                    var message = WYA.User.Result["message"] as? String
                    if message == nil {
                        message = WYA.User.Error
                    }
                    
                    let alertController = UIAlertController(title: "WARNING", message: message, preferredStyle:.Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true) {
                    }
                    return
                }
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
