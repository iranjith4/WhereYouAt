//
//  ViewController.swift
//  WhereYouAt
//
//  Created by Ranjith on 16/10/15.
//  Copyright © 2015 iranjith4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coverImage:UIImageView?
    var profileImage:UIImageView?
    var profileContent:UIView?
    var name:UILabel?
    var desc:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialSetup()
        loadControllerData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    func loadInitialSetup(){
        self.view.backgroundColor = Utilities.giveMeColorForRGB(22, green: 87, blue: 55)
        
        //Loading Cover Image
        coverImage = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.35))
        coverImage?.backgroundColor = Utilities.giveMeColorForRGB(230, green: 230, blue: 230)
        self.view.addSubview(coverImage!)
        
        //Loading ProfileImage
        profileImage = UIImageView()
        profileImage?.frame = CGRectMake(0, 0, self.view.frame.width * 0.50, self.view.frame.size.width * 0.50)
        profileImage?.center = CGPointMake(self.view.center.x, (coverImage?.frame.origin.y)! + (coverImage?.frame.size.height)!)
        profileImage?.backgroundColor = Utilities.giveMeColorForRGB(240, green: 240, blue: 240)
        profileImage?.layer.masksToBounds = true
        profileImage?.layer.borderWidth = 8
        profileImage?.layer.borderColor = UIColor.whiteColor().CGColor
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width)! / 2
        self.view.addSubview(profileImage!)
        
        //Loading Content View
        profileContent = UIView()
        profileContent?.frame = CGRectMake(self.view.frame.size.width * 0.05, (profileImage?.frame.size.height)! + (profileImage?.frame.origin.y)! + self.view.frame.size.width * 0.05, self.view.frame.size.width * 0.90, self.view.frame.size.height - (profileImage?.frame.origin.y)! - (profileImage?.frame.size.height)! - self.view.frame.size.width * 0.10)
        profileContent?.layer.cornerRadius = 5
        profileContent?.layer.borderWidth = 5
        profileContent?.layer.borderColor = Utilities.giveMeColorForRGB(103, green: 103, blue: 103).CGColor
        profileContent?.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(profileContent!)
        
        //loading Labels
        name = UILabel()
        name?.frame = CGRectMake((profileContent?.frame.size.width)! * 0.05, (self.profileContent?.frame.size.height)! * 0.15, (self.profileContent?.frame.size.width)! * 0.90, (profileContent?.frame.size.height)! * 0.10)
        name?.font = UIFont.systemFontOfSize(32)
        name?.textColor = Utilities.giveMeColorForRGB(114, green: 114, blue: 114)
        name?.textAlignment = NSTextAlignment.Center
        profileContent?.addSubview(name!)
        
        desc = UILabel()
        desc?.frame = CGRectMake((name?.frame.origin.x)!, (name?.frame.origin.y)! + (name?.frame.size.height)! + 15, (name?.frame.size.width)!, (name?.frame.size.height)!)
        desc?.font = UIFont.systemFontOfSize(18)
        desc?.textColor = UIColor.blackColor()
        desc?.numberOfLines = 0
        desc?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        desc?.textAlignment = NSTextAlignment.Left
        profileContent?.addSubview(desc!)
    }
    
    //Created Seperate methods, where the image set and other effects like, image animations can be added
    
    func setTheProfileImage(image:UIImage){
        self.profileImage?.contentMode = .ScaleAspectFit
        self.profileImage?.image = image
    }
    
    func setTheCoverImage(image:UIImage){
        self.coverImage?.contentMode = .ScaleAspectFill
        self.coverImage?.image = image
    }
    
    func setTheName(userName:String){
        name?.text = userName
        name?.textAlignment = NSTextAlignment.Center
    }
    
    func setTheDesc(descr:String){
        desc?.text = descr
        desc?.sizeToFit()
    }

    
    
    func loadControllerData(){
        // define the parameters
        //
        // call the API using the SDK
        // a good endpoint would be WYA.User.getCurrentUser(params)
        //
        let desiredAPIResults: NSDictionary = [
            "zulutime": "2015-04-23T03:28:13Z",
            "user": [
                "_id": "546ae4865c3eaaf4a68b4569",
                "user_username": "crwirz",
                "user_email_addresses": [
                    "crwirz@gmail.com"
                ],
                "user_first_name": "Christopher",
                "user_last_name": "Wirz",
                "user_last_update": [
                    "sec": 1429759694,
                    "usec": 26000
                ],
                "user_main_image_url": "https://s3.amazonaws.com/whereyouat-images/8a4dde99b66a0bcd1ff8df0048951fef2087a254ae9c9a39a51fd38bb85583b91b27336b109de028486e62e67cc8b1b27495725ebaabdf2f441afb61080e4935.png",
                "user_description": "Christopher is a full stack developer and systems engineer.",
                "user_cover_image_url": "https://s3.amazonaws.com/whereyouat-images/4e6fad7b19fd53178ac326b8a36b937acc4156bc3328d6df63cfd3927498a6090d4228232301a8be43fc6bf2aa23ba7d52fba460978dd1d99b89e4a307252c4e.jpg",
                "user_last_update_zulu": "2015-04-22T20:28:14Z",
                "user_last_update_utc": "2015-04-22 20:28:14",
                "user_last_update_standard": "04/22/2015",
                "user_last_update_ago": "0 seconds ago",
                "user_last_update_seconds": 1429759694.26,
                "current_user_can_modify": true,
                "current_user_can_content_edit": true,
                "user_display_name": "Christopher Wirz",
                "user_is_current_user": true
            ],
            "message": "crwirz was updated in the database.",
            "success": true
        ]
        
        let success: Bool = desiredAPIResults["success"] as! Bool!
        if (success) { // will enter the loop only if success evaluates to boolean true
            
            // first, try to see if result will cast as a dictionary, using the optional type
            let userTest: NSDictionary? = desiredAPIResults["user"] as! NSDictionary!
            if userTest != nil {
                
                // knowing it will cast as a dictionary, we cast it again as a traversable dictionary (the optional type is not traversable)
                let user: NSDictionary = desiredAPIResults["user"] as! NSDictionary!
                for (key, value) in user{
                    // this is the absolute safest way to check for a parameter
                    if key as! String == "user_display_name" {
                        print(value as! String)
                        
                    }
                    
                    if key as! String == "user_main_image_url" {
                        let url = NSURL(string: value as! String)
                        var image: UIImage?
                        let request: NSURLRequest = NSURLRequest(URL: url!)
                        let session = NSURLSession.sharedSession()
                        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                            image = UIImage(data: data!)
                            self.setTheProfileImage(image!)
                            })
                        task.resume()
                    }
                    
                    if key as! String == "user_cover_image_url" {
                        let url = NSURL(string: value as! String)
                        var image: UIImage?
                        let request: NSURLRequest = NSURLRequest(URL: url!)
                        let session = NSURLSession.sharedSession()
                        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                            image = UIImage(data: data!)
                            self.setTheCoverImage(image!)
                        })
                        task.resume()
                    }
                    
                    if key as! String == "user_display_name" {
                        self.setTheName((value as? String)!)
                    }
                    
                    if key as! String == "user_description" {
                        self.setTheDesc((value as? String)!)
                    }
                }
            }
        }

    }
}

