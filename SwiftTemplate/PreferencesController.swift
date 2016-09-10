//
//  PreferencesController.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Foundation
import ServiceManagement

class PreferencesController {
    static let sharedInstance = PreferencesController()

    private let launchAtLoginKey = "launchAtLogin"
    private let userDefaults = NSUserDefaults.standardUserDefaults()

    var launchAtLogin: Bool {
        set (newlaunchAtLogin) {
            userDefaults.setObject(newlaunchAtLogin, forKey: launchAtLoginKey)
            SMLoginItemSetEnabled(Global.Bundle.identifier_launcher, newlaunchAtLogin)
        }
        get {
            return userDefaults.objectForKey(launchAtLoginKey) as! Bool
        }
    }

    func registerDefaultPreferences() {
        DebugLog()
        let defaults = [ launchAtLoginKey : false ]
        userDefaults.registerDefaults(defaults)
    }

    private init() {
        DebugLog()
        self.registerDefaultPreferences()
    }


}