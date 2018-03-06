//
//  SignUpViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/18/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift
import RxCocoa
import TTGSnackbar

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var email: String!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        signUpButton.rx.tap.subscribe({[weak self] _ in self?.getQR()}).disposed(by: disposeBag)
        self.hideKeyboardWhenTappedAround()
    }
    
    func getQR(){
        self.email = emailTextField.text
        if(ValidationHelper.instance.validateEmail(email: self.email)){
            let query = "email=\(self.email!)"
            _ = WebService.instance.getRequest(endPoint: .signup, query: query).subscribe(onNext:{ json in
                print("====> JSON: \(json)")
                if(json["qr_code"].stringValue == ""){
                    let snackbar = TTGSnackbar(message:json["message"].stringValue , duration: .middle)
                    snackbar.show()
                }else{
                    UserDefaults.standard.set(json["qr_code"].stringValue, forKey: UserDefaultsKey.userQR.rawValue)
                    UserDefaults.standard.set(json["name"].stringValue, forKey: UserDefaultsKey.userName.rawValue)
                    UserDefaults.standard.set(json["phone"].stringValue, forKey: UserDefaultsKey.phone.rawValue)
                    UserDefaults.standard.set(json["team"].stringValue, forKey: UserDefaultsKey.team.rawValue)
                    UserDefaults.standard.set(json["university"].stringValue, forKey: UserDefaultsKey.university.rawValue)
                    UserDefaults.standard.set(json["photo"].stringValue, forKey: UserDefaultsKey.userPhoto.rawValue)
                    let snackbar = TTGSnackbar(message:"Successful...!!" , duration: .middle)
                    snackbar.show()
                    self.dismiss(animated: true, completion: nil)
                }
            }, onError: { error in
                let err = error as NSError
                print(err.localizedDescription)
                print(err.code)
                let snackbar = TTGSnackbar(message:err.localizedDescription , duration: .middle)
                snackbar.show()
            }).disposed(by: disposeBag)
        }else{
            let snackbar = TTGSnackbar(message:"Enter valid email" , duration: .middle)
            snackbar.show()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
