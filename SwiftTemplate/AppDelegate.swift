//
//  AppDelegate.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        DebugLog()
        var launchAtLogin = false

        for app in NSWorkspace.sharedWorkspace().runningApplications {
            if app.bundleIdentifier == Global.Bundle.identifier_launcher {
                launchAtLogin = true
            }
        }

        if launchAtLogin {
            NSDistributedNotificationCenter.defaultCenter().postNotificationName("terminateLauncher", object: Global.Bundle.identifier_main)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        DebugLog()
    }

    private override init() {
        DebugLog()
        super.init()
    }


}

