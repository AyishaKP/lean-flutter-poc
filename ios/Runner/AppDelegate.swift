import Flutter

import UIKit
import LeanSDK

// Used to connect plugins (only if you have plugins with iOS platform code).

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
//      UIApplication.shared.keyWindow?.rootViewController = ViewController();
//      UIApplication.shared.keyWindow?.makeKeyAndVisible();
//      Lean.manager.setup(appToken: "d928f97c-121f-48e7-8368-0c13af66631e", sandbox: true, version: "latest")
      Lean.manager.setup(appToken: "d928f97c-121f-48e7-8368-0c13af66631e", sandbox: true, version: "latest")
      let controller = window?.rootViewController as! FlutterViewController
      let webviewFactory = WebviewFactory(controller: controller)

      registrar(forPlugin: "webview")?.register(webviewFactory, withId: "webview")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
