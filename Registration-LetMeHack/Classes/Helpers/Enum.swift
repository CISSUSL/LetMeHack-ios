//
//  ViewController.swift
//  StaterPack-iOS-swift-4.0
//
//  Created by Kasun Gayashan on 2/7/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit

enum endPoint : String {
    case signup = "api/members"
    case questions = "api/questions"
}

enum respond : String {
    case loading = "loading"
    case success = "SUCCESS"
    case authFailed = "AUTH_FAILED"
    case recordNotExists = "-404"
    case noInternet = "-1009"
    case dataFetchFailed = "3"
    case requestTimedout = "-1001"
    case severOperationFailed = "-1003"
    case couldNotConnectServer = "-1004"
    case connectionLost = "-1005"
    case passwordNotMatch = "PASSWORD_NOT_MATCH"
    case `default`
}

enum UserDefaultsKey : String {
    case userId = "key_user_id"
    case accessToken = "key_access_token"
    case deviceToken = "key_device_token"
    case userEmail = "key_user_email"
    case userCountry = "key_user_country"
    case userQR = "user_qr"
    case userFirstName = "key_user_first_name"
    case userLastName = "key_user_last_name"
    case userLoginType = "key_user_login_type"
    
    case userName = "key_user_name"
    case userPhoto = "key_user_photo"
    case phone = "key_user_phone"
    case team =  "key_user_team"
    case university = "key_user_uni"
}

enum ViewControllerIdentifier : String {
    case viewController = "ViewController"
    case notificationViewController = "NotificationViewController"
    case agendaViewController = "agendaViewController"
    case fAQViewController = "FAQViewController"
    case homeViewController = "HomeViewController"
    case qRViewController = "QRViewController"
    case signUpViewController = "SignUpViewController"
}

enum StoryboardIdentifier : String {
    case main = "Main"
}

enum StoryboardSegueIdnetifier: String {
    case segue = "Segue"
    case about = "aboutUsSegue"
    case contact = "contactUsSegue"
    case sponsors = "sponsorsSegue"
}

enum CellIdentifier : String {
    case agendaHeaderCell = "AgendaHeaderCell"
    case agendaCell = "AgendaCell"
    case notificationCell = "NotificationCell"
    case fAQAnswersCell = "FAQAnswersCell"
    case fAQQuestionCell = "FAQQuestionCell"
    case sideMenuCell = "SideMenuCell"
    case sideMenuHeaderCell = "SideMenuHeaderCell"
    case sponsorsCell = "SponsorsCell"
    case sponsorHeaderCell = "SponsorHeaderCell"
}
