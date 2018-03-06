//
//  FAQViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/16/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu
//import CollapsibleTableSectionViewController
import MZFormSheetPresentationController
import RxCocoa
import RxSwift
import TTGSnackbar

class FAQViewController: BaseViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomImgView: UIImageView!
    @IBOutlet weak var signUpButton: UIBarButtonItem!
//    var sections: [Section] = sectionsData
    var disposeBag = DisposeBag()
    var questions : [String] = []
    var answers : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenu()
//        self.delegate = self
        self.navigationItem.rightBarButtonItem = nil
        let img = UIImage(named: "theme")!.alpha(0.5)
        self.bottomImgView.image = img
        
        var nibName = UINib(nibName: CellIdentifier.fAQQuestionCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forHeaderFooterViewReuseIdentifier: CellIdentifier.fAQQuestionCell.rawValue)
        
        nibName = UINib(nibName: CellIdentifier.fAQAnswersCell.rawValue, bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: CellIdentifier.fAQAnswersCell.rawValue)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedSectionHeaderHeight = 15;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Reachability.isConnectedToNetwork()){
            self.getFAQ()
        }else{
            self.activityIndicator.stopAnimating()
            self.alert(title:"", message: "Internet connection appears to be offline")
        }
    }
    
    @IBAction func hamButton(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
         self.passDataToViewControllerAction()
    }
    
    func getFAQ(){
        _ = WebService.instance.getRequest(endPoint: .questions).subscribe(onNext:{ json in
            print("====> JSON: \(json)")
            if let questions = json["questions"].arrayObject as? [String] {
                self.questions = questions
                print(self.questions)
            }
            if let answers = json["answers"].arrayObject as? [String] {
                self.answers = answers
                print(self.answers)
            }
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }, onError: { error in
            let err = error as NSError
            print(err.localizedDescription)
            print(err.code)
            let snackbar = TTGSnackbar(message:err.localizedDescription , duration: .middle)
            snackbar.show()
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension FAQViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FAQAnswersCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.fAQAnswersCell.rawValue) as! FAQAnswersCell
        cell.selectionStyle = .none
        cell.answerTextView.text = answers[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: FAQQuestionCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifier.fAQQuestionCell.rawValue) as! FAQQuestionCell
        cell.questionTextView.text = questions[section]
        cell.conView.layer.cornerRadius = 5.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
        return true
    }
    
}
