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
        
        self.view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     
        let label = UILabel()
        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
        
//        let contentController = WKUserContentController()
//        contentController.add(self, name: "setCookie")
//        contentController.add(self, name: "fireEvent")
//        let config = WKWebViewConfiguration()
//        config.userContentController = contentController
//
//        webView = WKWebView(frame: .zero, configuration: config)
//        webView.insetsLayoutMarginsFromSafeArea = true
//
//        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Hello, Welcome to Swiggy")
//        let myURL = URL(string:"https://google.com/")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "setCookie"){
            print("Set Cookie: \(message.body)")
        }
        if (message.name == "fireEvent"){
            print("Fire Event: \(message)")
        }
    }
}
