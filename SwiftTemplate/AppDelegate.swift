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
    var preferencesController: PreferencesController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DebugLog()
        var launchAtLogin = false

        for app in NSWorkspace.shared.runningApplications {
            if app.bundleIdentifier == Global.Bundle.identifier_launcher {
                launchAtLogin = true
            }
        }

        if launchAtLogin {
            DistributedNotificationCenter.default().post(name: NSNotification.Name("terminateLauncher"), object: Global.Bundle.identifier_main)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        DebugLog()
    }

    fileprivate override init() {
        DebugLog()
        super.init()
        self.preferencesController = PreferencesController.sharedInstance
    }


}

