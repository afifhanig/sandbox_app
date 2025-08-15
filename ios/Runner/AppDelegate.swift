import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var field = UITextField()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let screenshotChannel = FlutterMethodChannel(name: "com.example.screenshot/prevention", binaryMessenger: controller.binaryMessenger)
    screenshotChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "enableScreenshotPrevention" {
          self?.enableScreenshotPrevention()
          result(nil)
      } else if call.method == "disableScreenshotPrevention" {
          self?.disableScreenshotPrevention()
          result(nil)
      } else {
          result(FlutterMethodNotImplemented)
      }
    })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationWillResignActive(_ application: UIApplication) {
    field.isSecureTextEntry = false
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    field.isSecureTextEntry = true
  }

  private func addSecuredView() {
    if (!window.subviews.contains(field)) {
        window.addSubview(field)
        field.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
        field.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        window.layer.superlayer?.addSublayer(field.layer)
        if #available(iOS 17.0, *) {
          field.layer.sublayers?.last?.addSublayer(window.layer)
        } else {
          field.layer.sublayers?.first?.addSublayer(window.layer)
        }
    }
  }

  private func enableScreenshotPrevention() {
    addSecuredView()
    field.isSecureTextEntry = true
  }

  private func disableScreenshotPrevention() {
    field.removeFromSuperview()
  }
}
