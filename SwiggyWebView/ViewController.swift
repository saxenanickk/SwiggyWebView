//
//  ViewController.swift
//  SwiggyWebView
//
//  Created by Nikhil Saxena on 06/05/19.
//  Copyright © 2019 incredicodes. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    
    @IBOutlet var containerView: UIView? = nil
    var webView: WKWebView!

    override func loadView() {
        super.loadView()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "setCookie")
        contentController.add(self, name: "fireEvent")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello, Welcome to Swiggy")
        let myURL = URL(string:"https://www.swiggy.com/?utm_source=RMZ&utm_campaign=RMZ&platform=RMZ&token=61B667C88FB270F558FB9254F94A2D73")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {// edit: changed fun to func
        if (message.name == "setCookie"){
            print("Set Cookie: \(message)")
        }
        if (message.name == "fireEvent"){
            print("Fire Event: \(message)")
        }
    }
}
