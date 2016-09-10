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

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        DebugLog()
        let running           = NSWorkspace.sharedWorkspace().runningApplications

        var alreadyRunning    = false

        for app in running {
            if app.bundleIdentifier == Global.Bundle.identifier_main {
                alreadyRunning = true
                break
            }
        }

        if !alreadyRunning {
            NSDistributedNotificationCenter.defaultCenter().addObserver(self, selector: "terminateApplication", name: "terminateLauncher", object: Global.Bundle.identifier_main)

            let path = NSBundle.mainBundle().bundlePath as NSString

            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.append("MacOS")
            components.append(Global.Bundle.name_main)

            let newPath = NSString.pathWithComponents(components)
            NSWorkspace.sharedWorkspace().launchApplication(newPath)
        }
        else {
            NSApplication.sharedApplication().terminate(nil)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        DebugLog()
    }

    func terminateApplication() {
        DebugLog()
        NSApplication.sharedApplication().terminate(nil)
    }

    private override init() {
        DebugLog()
        super.init()
    }


}

