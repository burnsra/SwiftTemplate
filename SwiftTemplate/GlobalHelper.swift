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
        static let build: String = Foundation.Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        static let identifier: String = Foundation.Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String
        static let name: String = Foundation.Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        static let version: String = Foundation.Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

        static let identifier_main: String = identifier.replacingOccurrences(of: txt_launcher, with: "")
        static let identifier_launcher: String = identifier_main + txt_launcher

        static let name_main: String = name.replacingOccurrences(of: txt_launcher, with: "")
        static let name_launcher: String = name_main + txt_launcher
    }


}

public func DebugLog ( _ message: String = "",
                       file: String = #file,
                       line: Int = #line,
                       method: String = #function) {
    let lastPath: String = URL(fileURLWithPath: file).lastPathComponent 
    let fileName = lastPath.components(separatedBy: ".")[0]
    let methodName = method.replacingOccurrences(of: "()", with: "")
    NSLog("\(fileName):\(line) \(methodName) \(message)")
}
