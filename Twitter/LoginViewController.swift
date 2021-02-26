//
//  LoginViewController.swift
//  Twitter
//
//  Created by Paul Junver Soriano on 2/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ _animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        print("Login Button Clicked.")
        let loginUrl = "https://api.twitter.com/oauth/request_token"
        // LESSON: Closure -- url, what do to when it works and doesn't.
        TwitterAPICaller.client?.login(url: loginUrl, success: {
            UserDefaults.standard.set(true, forKey:"userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in!")
        })
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
