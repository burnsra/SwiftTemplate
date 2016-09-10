//
//  StatusMenuController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    var preferencesWindowController = PreferencesWindowController.sharedInstance

    var item_about = NSMenuItem()
    var item_documentation = NSMenuItem()
    var item_preferences = NSMenuItem()
    var item_quit = NSMenuItem()
    var statusMenu = NSMenu()

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

    @IBAction func clickAbout(sender: NSMenuItem) {
        DebugLog()
        NSApplication.sharedApplication().orderFrontStandardAboutPanel(sender)
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }

    @IBAction func clickDocumentation(sender: NSMenuItem) {
        DebugLog()
        if let url: NSURL = NSURL(string: Global.url_github) {
            NSWorkspace.sharedWorkspace().openURL(url)
        }
    }

    @IBAction func clickPreferences(sender: NSMenuItem) {
        DebugLog()
        preferencesWindowController.showWindow(sender)
    }

    @IBAction func clickQuit(sender: NSMenuItem) {
        DebugLog()
        NSApplication.sharedApplication().terminate(sender)
    }

    private override init() {
        DebugLog()
        super.init()
        statusMenu.delegate = self

        let icon = NSImage(named: NSImageNameIconViewTemplate)
        icon?.template = true

        statusItem.image = icon
        statusItem.menu = statusMenu
        statusItem.toolTip = "\(Global.Bundle.name) \(Global.Bundle.version)"

        item_about.action = #selector(clickAbout(_:))
        item_about.target = self
        item_about.title = "About"

        item_documentation.action = #selector(clickDocumentation(_:))
        item_documentation.target = self
        item_documentation.title = "Documentation..."

        item_preferences.action = #selector(clickPreferences(_:))
        item_preferences.target = self
        item_preferences.title = "Preferences..."

        item_quit.action = #selector(clickQuit(_:))
        item_quit.target = self
        item_quit.title = "Quit"

        statusMenu.addItem(item_preferences)
        statusMenu.addItem(NSMenuItem.separatorItem())
        statusMenu.addItem(item_about)
        statusMenu.addItem(item_documentation)
        statusMenu.addItem(NSMenuItem.separatorItem())
        statusMenu.addItem(item_quit)
    }


}

extension StatusMenuController: NSMenuDelegate {
    func menuWillOpen(menu: NSMenu) {
        DebugLog()
    }

    func menuDidClose(menu: NSMenu) {
        DebugLog()
    }


}
