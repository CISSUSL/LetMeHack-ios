//
//  SponsorsViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/21/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nibName = UINib(nibName: CellIdentifier.sponsorHeaderCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forHeaderFooterViewReuseIdentifier: CellIdentifier.sponsorHeaderCell.rawValue)
        
        nibName = UINib(nibName: CellIdentifier.sponsorsCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: CellIdentifier.sponsorsCell.rawValue)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension SponsorsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SponsorsCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sponsorsCell.rawValue) as! SponsorsCell
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.imgView1.image = #imageLiteral(resourceName: "hackathonlk")
            cell.imgView2.image = #imageLiteral(resourceName: "gapstars")
            cell.imgView3.image = #imageLiteral(resourceName: "readme")
            break
        case 1:
            cell.imgView1.image = #imageLiteral(resourceName: "lakspace")
            cell.imgView2.image = #imageLiteral(resourceName: "99x")
            cell.imgView3.image = #imageLiteral(resourceName: "rs_matrix")
            break
        case 2:
            cell.imgView1.image = #imageLiteral(resourceName: "ceydigital")
            cell.imgView2.image = #imageLiteral(resourceName: "authnex")
            cell.imgView3.image = #imageLiteral(resourceName: "compro")
            break
        case 3:
            cell.imgView1.image = #imageLiteral(resourceName: "hsenid")
            cell.imgView2.image = #imageLiteral(resourceName: "virtusa")
            cell.imgView3.image = #imageLiteral(resourceName: "syscolabs")
            break
        case 4:
            cell.imgView1.image = #imageLiteral(resourceName: "ryde")
            cell.imgView2.image = #imageLiteral(resourceName: "ifs")
            cell.imgView3.image = #imageLiteral(resourceName: "arimac")
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: SponsorHeaderCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifier.sponsorHeaderCell.rawValue) as! SponsorHeaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
