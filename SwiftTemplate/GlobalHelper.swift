//
//  GlobalHelper.swift
//  SwiftTemplate
//
//  Created by Robert Burns on 9/9/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

import Foundation

struct Global {

    static let txt_launcher: String = "Launcher"
    static let url_github: String = "https://github.com/burnsra/" + Bundle.name_main

    struct Bundle {
        static let build: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String
        static let identifier: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as! String
        static let name: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
        static let version: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String

        static let identifier_main: String = identifier.stringByReplacingOccurrencesOfString(txt_launcher, withString: "")
        static let identifier_launcher: String = identifier_main + txt_launcher

        static let name_main: String = name.stringByReplacingOccurrencesOfString(txt_launcher, withString: "")
        static let name_launcher: String = name_main + txt_launcher
    }


}

public func DebugLog ( message: String = "",
                       file: String = #file,
                       line: Int = #line,
                       method: String = #function) {
    let lastPath: String = NSURL(fileURLWithPath: file).lastPathComponent ?? file
    let fileName = lastPath.componentsSeparatedByString(".")[0]
    let methodName = method.stringByReplacingOccurrencesOfString("()", withString: "")
    NSLog("\(fileName):\(line) \(methodName) \(message)")
}