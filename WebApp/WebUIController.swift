//
//  WebUIController.swift
//  WebApp
//
//  Created by Usman Tahir Qureshi on 2/8/23.
//

import UIKit
import WebKit
class WebUIController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let textView = UITextView()
        webView = WKWebView.init(frame: CGRect.zero)
        webView.navigationDelegate = self
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.text = "Hello world"
        
        //view = textView
        view = ChatView
        
    }
    
    @objc func fireTimer() {
        self.webView.evaluateJavaScript("document.documentElement.querySelectorAll('[data-testid=\"youchat-text\"]')[0].children[0].innerHTML",
                                        completionHandler: { (html: Any?, error: Error?) in
            if let text = html {
                print(text)
            }
        })
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://you.com/search?q=what%20date%20is%20today&tbm=youchat")!
        webView.load(URLRequest(url: url))
    }
}

