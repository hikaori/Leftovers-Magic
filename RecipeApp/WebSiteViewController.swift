//
//  WebSiteViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-04.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit
import WebKit

class WebSiteViewController: UIViewController ,WKUIDelegate, WKNavigationDelegate{
    var webURL = ""
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: webURL)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
        // run this method after load the site
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        let title = webView.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
