//
//  AgendaViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/13/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu

class AgendaViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpButton: UIBarButtonItem!
    @IBOutlet weak var bottomImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
        self.navigationItem.rightBarButtonItem = nil
        
        var nibName = UINib(nibName: CellIdentifier.agendaCell.rawValue, bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: CellIdentifier.agendaCell.rawValue)
        nibName = UINib(nibName: CellIdentifier.agendaHeaderCell.rawValue, bundle:nil)
        self.tableView.register(nibName, forHeaderFooterViewReuseIdentifier: CellIdentifier.agendaHeaderCell.rawValue)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
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

extension AgendaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 7
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AgendaCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.agendaCell.rawValue) as! AgendaCell
        cell.selectionStyle = .none
        
        cell.circleView.clipsToBounds = true
        cell.circleView.layer.cornerRadius = 5
        
        switch indexPath.section {
        case 0:
            if(indexPath.row == 0){
                cell.lineLabel.isHidden = true
                cell.lineLableBottom.isHidden = false
                cell.timeLabel.text = "09.00am"
                cell.eventLabel.text = "Registration"
                cell.locationLabel.text = "University Pool Side"
            }else if(indexPath.row == 1){
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "10.00am"
                cell.eventLabel.text = "Opening Ceremony"
                cell.locationLabel.text = "Management Auditorium"
            }else if(indexPath.row == 2){
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "11.00am"
                cell.eventLabel.text = "Code Hike Start"
                cell.locationLabel.text = "Social Sciences Auditorium"
            }else if(indexPath.row == 3){
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "12.00pm"
                cell.eventLabel.text = "Lunch"
                cell.locationLabel.text = "Default"
            }else if(indexPath.row == 4){
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "03.00pm"
                cell.eventLabel.text = "Evening Snack"
                cell.locationLabel.text = "Social Sciences Auditorium"
            }else if(indexPath.row == 5){
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "07.00pm"
                cell.eventLabel.text = "Dinner"
                cell.locationLabel.text = "Default"
            }else if(indexPath.row == 6){
                cell.lineLableBottom.isHidden = true
                cell.lineLabel.isHidden = false
                cell.timeLabel.text = "11.00pm"
                cell.eventLabel.text = "Night Snack"
                cell.locationLabel.text = "Social Sciences Auditorium"
            }else{
                cell.lineLableBottom.isHidden = false
                cell.lineLabel.isHidden = false
            }
            break
        case 1:
            if(indexPath.row == 0){
                cell.lineLabel.isHidden = true
                cell.lineLableBottom.isHidden = false
                cell.timeLabel.text = "02.00am"
                cell.eventLabel.text = "Code Hike End"
                cell.locationLabel.text = "Social Sciences Auditorium"
            }else if(indexPath.row == 1){
                cell.lineLabel.isHidden = false
                cell.lineLableBottom.isHidden = false
                cell.timeLabel.text = "02.00am"
                cell.eventLabel.text = "Camp Fire with snack"
                cell.locationLabel.text = "Hunduwa Ground"
            }else if(indexPath.row == 2){
                cell.lineLabel.isHidden = false
                cell.lineLableBottom.isHidden = false
                cell.timeLabel.text = "05.30am"
                cell.eventLabel.text = "Morning Tea"
                cell.locationLabel.text = "Social Sciences Auditorium"
            }else if(indexPath.row == 3){
                cell.lineLabel.isHidden = false
                cell.lineLableBottom.isHidden = false
                cell.timeLabel.text = "06.00am"
                cell.eventLabel.text = "Awarding Ceremony"
                cell.locationLabel.text = "Management Auditorium"
            }else if(indexPath.row == 4){
                cell.lineLabel.isHidden = false
                cell.lineLableBottom.isHidden = true
                cell.timeLabel.text = "07.00am"
                cell.eventLabel.text = "End of Event and Breakfast"
                cell.locationLabel.text = "Management Auditorium"
            }else{
                cell.lineLabel.isHidden = false
                cell.lineLableBottom.isHidden = false
            }
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifier.agendaHeaderCell.rawValue) as! AgendaHeaderCell
        
        switch section {
        case 0:
            cell.dayLabel.text = "Saturday"
            cell.dateLabel.text = "24"
            cell.titleLabel.text = "FIRST DAY"
            break
        case 1:
            cell.dayLabel.text = "Sunday"
            cell.dateLabel.text = "25"
            cell.titleLabel.text = "SECOND DAY"
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
}
extension AgendaViewController: AOAlertDelegate {
    
    func didTapActionButton() {
        self.showActivityIndicator(uiView: self.view)
    }
}
