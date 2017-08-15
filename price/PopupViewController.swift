//
//  ViewController.swift
//  price
//
//  Created by lgh on 15/08/2017.
//  Copyright © 2017 watsy0007. All rights reserved.
//

import Cocoa
import WebKit

@available(OSX 10.10, *)
class PopupViewController: NSViewController, WKUIDelegate {

    var webview : WKWebView!
    
    override func loadView() {
        
    }
    
    override func viewDidLoad() {
    
        // Do view setup here.
        let webConfiguration = WKWebViewConfiguration()
        // Webview的偏好设置
        webConfiguration.preferences = WKPreferences()
        webConfiguration.preferences.javaScriptCanOpenWindowsAutomatically = false;
        webConfiguration.preferences.minimumFontSize = 10
        webConfiguration.preferences.javaScriptEnabled = true
        
        webview = WKWebView(frame: view.bounds, configuration: webConfiguration)
        webview.uiDelegate = self as! WKUIDelegate
        view.addSubview(webview)
        
        let htmlPath = Bundle.main.path(forResource: "sosobtc", ofType: "html")
        let htmlUrl = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        
        
        
        if #available(OSX 10.11, *) {
            webview.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        } else {
            // Fallback on earlier versions
        }
       
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}


