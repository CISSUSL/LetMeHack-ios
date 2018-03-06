//
//  NotificationViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/16/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu

class NotificationViewController: BaseViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signUpButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
        self.navigationItem.rightBarButtonItem = nil
        
        let nibName = UINib(nibName: CellIdentifier.notificationCell.rawValue, bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: CellIdentifier.notificationCell.rawValue)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let img = UIImage(named: "theme")!.alpha(0.5)
        self.bottomImgView.image = img
        
    }
    
    @IBAction func hamButton(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
         self.passDataToViewControllerAction()
    }
    
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NotificationCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.notificationCell.rawValue) as! NotificationCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
   
}
extension NotificationViewController: AOAlertDelegate {
    
    func didTapActionButton() {
        self.showActivityIndicator(uiView: self.view)
    }
}

