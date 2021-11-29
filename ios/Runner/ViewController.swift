////
////  ViewController.swift
////  ViewController
////
////  Created by Ayisha Farhan on 28/11/2021.
////
//
//import UIKit
//import WebKit
//
//class ViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor.blue;
//        
//    }
//    
//    public func makeUIView(context: Context) -> WKWebView { // set up the config of the view
//        let webViewConfiguration = WKWebViewConfiguration();
//        webViewConfiguration.userContentController = self;
//        // create the webview
//        let webview = FullScreenWKWebView(frame: .zero, configuration: webViewConfiguration);
//        // set the webview styles
//        webview.isOpaque = false;
//        webview.navigationDelegate = self.navigationDelegate;
//        webview.backgroundColor = UIColor.clear;
//        webview.scrollView.backgroundColor = UIColor.clear;
//        DispatchQueue.main.async {  webview.superview?.superview?.backgroundColor = .clear;
//        }
//        return webview;
//        
//    }
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
