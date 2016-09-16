//
//  AppDelegate.swift
//  SwiftTemplateLauncher
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DebugLog()
        let running           = NSWorkspace.shared().runningApplications

        var alreadyRunning    = false

        for app in running {
            if app.bundleIdentifier == Global.Bundle.identifier_main {
                alreadyRunning = true
                break
            }
        }

        if !alreadyRunning {
            DistributedNotificationCenter.default().addObserver(forName: NSNotification.Name("terminateLauncher"), object: nil, queue: OperationQueue.main) { _ in
                self.terminateApplication()
            }

            let path = Bundle.main.bundlePath as NSString

            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.append("MacOS")
            components.append(Global.Bundle.name_main)

            let newPath = NSString.path(withComponents: components)
            NSWorkspace.shared().launchApplication(newPath)
        }
        else {
            NSApplication.shared().terminate(nil)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        DebugLog()
    }

    func terminateApplication() {
        DebugLog()
        NSApplication.shared().terminate(nil)
    }

    fileprivate override init() {
        DebugLog()
        super.init()
    }


}

