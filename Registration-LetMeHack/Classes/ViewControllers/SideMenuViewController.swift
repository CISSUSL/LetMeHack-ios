//
//  SideMenuViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/17/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        var nibName = UINib(nibName: CellIdentifier.sideMenuHeaderCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forHeaderFooterViewReuseIdentifier: CellIdentifier.sideMenuHeaderCell.rawValue)
        
        nibName = UINib(nibName: CellIdentifier.sideMenuCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: CellIdentifier.sideMenuCell.rawValue)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideMenuCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sideMenuCell.rawValue) as! SideMenuCell
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Sponsors"
            break
        case 1:
            cell.titleLabel.text = "About"
            break
        case 2:
            cell.titleLabel.text = "Contacts"
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: SideMenuHeaderCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifier.sideMenuHeaderCell.rawValue) as! SideMenuHeaderCell
        
        cell.conView.dropShadow(color: .white, offSet: CGSize(width: 0, height: 0))
        cell.imgView.layer.cornerRadius = 46.0
        cell.imgView.clipsToBounds = true
        cell.imgView.layer.masksToBounds = true
        
        let name = UserDefaults.standard.string(forKey: UserDefaultsKey.userName.rawValue)
        let phone = UserDefaults.standard.string(forKey: UserDefaultsKey.phone.rawValue)
        let team = UserDefaults.standard.string(forKey: UserDefaultsKey.team.rawValue)
        let university = UserDefaults.standard.string(forKey: UserDefaultsKey.university.rawValue)
        let photo = UserDefaults.standard.string(forKey: UserDefaultsKey.userPhoto.rawValue)

        if(name != "" && name != nil ){
            cell.nameLabel.text = name
        }
        if(team != "" && team != nil ){
            cell.teamLabel.text = team
        }
        if(university != "" && university != nil ){
            cell.universityLabel.text = university
        }
        if(photo != "" && photo != nil ){
            print(photo)
            cell.imgView.loadImage(urlString: photo!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: StoryboardSegueIdnetifier.sponsors.rawValue, sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: StoryboardSegueIdnetifier.about.rawValue, sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: StoryboardSegueIdnetifier.contact.rawValue, sender: self)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
