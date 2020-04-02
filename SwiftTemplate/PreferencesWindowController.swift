//
//  PreferencesWindowController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

let preferencesController = PreferencesController.sharedInstance

class PreferencesWindowController: NSWindowController {
    static let sharedInstance = PreferencesWindowController()

    @IBOutlet weak var launchAtLoginButton: NSButton!

    @IBAction func launchAtLoginClicked(_ sender: NSButton) {
        DebugLog()
        switch sender.state {
        case NSControl.StateValue.on:
            preferencesController.launchAtLogin = true
        case NSControl.StateValue.off:
            preferencesController.launchAtLogin = false
        default:
            preferencesController.launchAtLogin = false
        }
    }

    override var windowNibName : String! {
        return "\(type(of: self))"
    }

    override func showWindow(_ sender: Any?) {
        DebugLog()
        super.showWindow(sender)
        self.window?.center()
        self.window?.orderFront(self)
        self.window?.title = "\(Global.Bundle.name_main) Preferences"
        NSApplication.shared.activate(ignoringOtherApps: true)
    }

    override func windowDidLoad() {
        DebugLog()
        super.windowDidLoad()
        populatePreferencesWindow()
    }

    func populatePreferencesWindow() {
        DebugLog()
        switch preferencesController.launchAtLogin {
        case true:
            launchAtLoginButton.state = NSControl.StateValue.on
        case false:
            launchAtLoginButton.state = NSControl.StateValue.off
        }
    }

    func windowWillClose(_ notification: Notification) {
        DebugLog()
    }

}
