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
    var chatView = ChatView()
    //var MyChat = MyChatView()
    override func loadView() {
        
        let textView = UITextView()
        
        webView = WKWebView.init(frame: CGRect.zero)
        webView.navigationDelegate = self
//        textView.autocapitalizationType = .sentences
//        textView.isSelectable = true
//        textView.isUserInteractionEnabled = true
//        textView.text = "Hello world"
        //webView.addSubview(chatView)
        //chatView = ChatView(frame: .zero)
    
        //chatView.isUserInteractionEnabled = true
        //self.view = chatView
        view = chatView
        
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
        let url = URL(string: "https://you.com/search?q=where+is+gvsu&fromSearchBar=true&tbm=youchat")!
        webView.load(URLRequest(url: url))
        
        //webView = WKWebView(frame: view.bounds)
        //view.addSubview(webView)
        
        chatView.setNeedsDisplay(CGRect(x: 0, y: 0, width: 200, height: 200) )
        //chatView.addSubview(MyChat)
        //chatView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //chatView.backgroundColor = .red
        webView.addSubview(chatView)
    }
}

