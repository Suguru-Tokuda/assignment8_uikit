//
//  WebViewController.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var urlStr: String?
    
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        DispatchQueue.main.async { [weak self] in
            if let self,
               let urlStr = self.urlStr,
               let url = URL(string: urlStr) {
                webView.load(URLRequest(url: url))
            }
        }
        
        applyConstrants()
    }
    
    private func applyConstrants() {
        let margins = view.layoutMarginsGuide

        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            webView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
    }
}
