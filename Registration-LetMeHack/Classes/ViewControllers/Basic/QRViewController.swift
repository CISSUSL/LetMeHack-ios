//
//  QRViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/16/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu
import KFSwiftImageLoader

class QRViewController: BaseViewController {
    
    @IBOutlet weak var qRImageView: UIImageView!
    @IBOutlet weak var signUpButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
        self.navigationItem.rightBarButtonItem = nil
        
        let qrUrl = UserDefaults.standard.string(forKey: UserDefaultsKey.userQR.rawValue)
        if(qrUrl == ""){
            self.alert(title: "", message: "Please Sign Up")
        }else if(qrUrl == nil){
            self.alert(title: "", message: "Please Sign Up")
        }
        else{
            self.qRImageView.loadImage(urlString: qrUrl!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let qrUrl = UserDefaults.standard.string(forKey: UserDefaultsKey.userQR.rawValue)
        if(qrUrl == ""){
            self.alert(title: "", message: "Please Sign Up")
        }else if(qrUrl == nil){
            self.alert(title: "", message: "Please Sign Up")
        }else{
            self.qRImageView.loadImage(urlString: qrUrl!)
        }
    }
    
    @IBAction func hamButton(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
         self.passDataToViewControllerAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
