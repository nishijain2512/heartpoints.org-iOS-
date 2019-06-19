//
//  ViewController.swift
//  heartpoints.org
//
//  Created by Nishi Jain on 6/17/19.
//  Copyright © 2019 Heartpoints.org. All rights reserved.
//


// NOTE: iOS by default dont allow unsecured sites to load. So to load http websites, go to info.plist, add ""App Transport Security Settings" then set "Allow Arbitary Loads" to YES.

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    @IBOutlet weak var forwardBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL = URL(string:"http://www.heartpoints.org")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.navigationDelegate = self
    }

    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backBarButton.isEnabled = webView.canGoBack
        forwardBarButton.isEnabled = webView.canGoForward
    }
}

