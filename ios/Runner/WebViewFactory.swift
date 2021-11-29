//
//  WebViewFactory.swift
//  WebViewFactory
//
//  Created by Ayisha Farhan on 28/11/2021.
//

import Foundation

public class WebviewFactory : NSObject, FlutterPlatformViewFactory {
    let controller: FlutterViewController
    
    init(controller: FlutterViewController) {
        self.controller = controller
    }
    
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        let channel = FlutterMethodChannel(
            name: "webview" + String(viewId),
            binaryMessenger: controller as! FlutterBinaryMessenger
        )
        return MyWebview(frame, viewId: viewId, channel: channel, args: args)
    }
}
