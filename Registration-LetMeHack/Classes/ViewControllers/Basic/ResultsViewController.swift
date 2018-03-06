//
//  ResultsViewController.swift
//  Registration-LetMeHack
//
//  Created by Kasun Gayashan on 2/20/18.
//  Copyright © 2018 cis4. All rights reserved.
//

import UIKit
import SideMenu

class ResultsViewController: BaseViewController,UIScrollViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.scrollView.delegate = self
        webView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = nil
        if(Reachability.isConnectedToNetwork()){
            self.activityIndicator.startAnimating()
            webView.loadRequest(URLRequest(url: URL(string: "http://139.59.70.75:4200/api/stats")!))
            //        webView.loadRequest(URLRequest(url: URL(string: "https://www.google.lk/?gfe_rd=cr&dcr=0&ei=qxaMWt2OBaiIX4aGr5gJ")!))
        }else{
            self.alert(title:"", message: "Internet connection appears to be offline")
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func hamButtonTapped(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        if(Reachability.isConnectedToNetwork()){
            webView.reload()
            self.activityIndicator.startAnimating()
        }else{
            self.alert(title:"", message: "Internet connection appears to be offline")
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    internal func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if (scrollView.contentOffset.y < 0){
            if(Reachability.isConnectedToNetwork()){
                webView.reload()
                self.activityIndicator.startAnimating()
            }else{
                self.activityIndicator.stopAnimating()
                self.alert(title:"", message: "Internet connection appears to be offline")
            }
        }
    }

}

extension ResultsViewController : UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.activityIndicator.stopAnimating()
    }
    
}
