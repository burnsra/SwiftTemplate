//
//  PreferencesWindowController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    static let sharedInstance = PreferencesWindowController()

    @IBOutlet weak var launchAtLoginButton: NSButton!

    @IBAction func launchAtLoginClicked(sender: NSButton) {
        DebugLog()
    }

    override var windowNibName : String! {
        return "\(self.dynamicType)"
    }

    override func showWindow(sender: AnyObject?) {
        DebugLog()
        super.showWindow(sender)
        self.window?.center()
        self.window?.orderFront(self)
        self.window?.title = "\(Global.Bundle.name_main) Preferences"
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }

    override func windowDidLoad() {
        DebugLog()
        super.windowDidLoad()
    }

    func windowWillClose(notification: NSNotification) {
        DebugLog()
    }

}
