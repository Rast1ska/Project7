//
//  DetaildViewController.swift
//  Project7
//
//  Created by Ильфат Салахов on 02.02.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


