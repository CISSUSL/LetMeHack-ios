//
//  HomeViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/10/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
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
