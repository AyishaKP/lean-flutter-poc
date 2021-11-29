//
//  myWebview.swift
//  myWebview
//
//  Created by Ayisha Farhan on 28/11/2021.
//

import Foundation
import UIKit
import WebKit
import LeanSDK

public class MyWebview: NSObject, FlutterPlatformView, WKScriptMessageHandler, WKNavigationDelegate {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    let frame: CGRect
    let viewId: Int64
    let channel: FlutterMethodChannel
    let webview: WKWebView
     var isPresented = false
     var customerId: String = ""
    var paymentDestinationId: String = ""
     var bankId: String = ""
     

    
    
    init(_ frame: CGRect, viewId: Int64, channel: FlutterMethodChannel, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.channel = channel
        
        let config = WKWebViewConfiguration()
        let webview = WKWebView(frame: frame, configuration: config)

        self.webview = webview

        super.init()
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if (call.method == "loadUrl") {
//                let url = call.arguments as! String // uncomment to load google
                if let url = Bundle.main.url(forResource: "lean", withExtension: "html") {
                    webview.load(URLRequest(url: url))
                }
            }
        })
        
    }
    func leanCreatePaymentSource() {
        isPresented = true
        Lean.manager.createPaymentSource(
            customerId: "2506c3d5-3797-4eb6-a5cd-82b9ffff4f35",
            bankId: (bankId.count > 1) ? bankId : nil,
            paymentDestinationId: paymentDestinationId.count > 1 ? paymentDestinationId : nil,
            success: {
                print("Link Success")
                self.isPresented = false
            }, error: { (status) in
                print(status)
                self.isPresented = false
                
            }
        )
    }
    
    public func view() -> UIView {
        return self.webview
    }
}




