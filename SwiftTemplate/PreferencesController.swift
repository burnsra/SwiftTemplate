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

    fileprivate let launchAtLoginKey = "launchAtLogin"
    fileprivate let userDefaults = UserDefaults.standard

    var launchAtLogin: Bool {
        set (newlaunchAtLogin) {
            userDefaults.set(newlaunchAtLogin, forKey: launchAtLoginKey)
            SMLoginItemSetEnabled(Global.Bundle.identifier_launcher as CFString, newlaunchAtLogin)
        }
        get {
            return userDefaults.object(forKey: launchAtLoginKey) as! Bool
        }
    }

    func registerDefaultPreferences() {
        DebugLog()
        let defaults = [ launchAtLoginKey : false ]
        userDefaults.register(defaults: defaults)
    }

    fileprivate init() {
        DebugLog()
        self.registerDefaultPreferences()
    }


}
