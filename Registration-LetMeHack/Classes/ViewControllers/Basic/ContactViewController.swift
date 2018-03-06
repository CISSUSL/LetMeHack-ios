//
//  ContactViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/21/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callPressed(_ sender: Any) {
        guard let number = URL(string: "tel://" + "0714456755") else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func emailPressed(_ sender: Any) {
        let email = "info@letmehack.lk"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func webPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string : "http://letmehack.lk/")!, options: [:], completionHandler: { (status) in
            
        })
    }
    
    @IBAction func fbPressed(_ sender: Any) {
        let appURL = NSURL(string: "fb://profile/925025550980059")!
        let webURL = NSURL(string: "https://www.facebook.com/Letmehack.lk/")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    @IBAction func twiPressed(_ sender: Any) {
        let appURL = NSURL(string: "twitter://user?username=letmehack2k18")!
        let webURL = NSURL(string: "https://twitter.com/letmehack2k18")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    @IBAction func insPressed(_ sender: Any) {
        
        let appURL = NSURL(string: "instagram://user?username=letmehack2k18")!
        let webURL = NSURL(string: "https://www.instagram.com/letmehack2k18/?hl=en")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
