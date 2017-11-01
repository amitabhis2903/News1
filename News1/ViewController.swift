//
//  ViewController.swift
//  News1
//
//  Created by Ammy Pandey on 29/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    var fbLoginSuccess = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginBtn = FBSDKLoginButton()
        loginBtn.frame = CGRect(x: 16, y: 300, width: view.frame.width - 32, height: 50)
        loginBtn.readPermissions = ["public_profile", "user_friends", "email"]
        view.addSubview(loginBtn)
        loginBtn.backgroundColor = UIColor.clear
        
        loginBtn.delegate = self
        
        func viewWillAppear(_ animated: Bool) {
            if (FBSDKAccessToken.current() != nil && fbLoginSuccess == true)
            {
                performSegue(withIdentifier: "home", sender: self)
            }
        }

        self.viewWillAppear(true)
    }
   
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out from facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                let fbDetails = result as! NSDictionary
                print(fbDetails)
                let viewController = self.storyboard!.instantiateViewController(withIdentifier: "home") as UIViewController
                self.present(viewController, animated: true, completion: nil)
            }else{
                print(error?.localizedDescription ?? "Not found")
            }
            return
        })
        
    }


}

