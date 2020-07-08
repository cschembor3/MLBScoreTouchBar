//
//  AppDelegate.swift
//  MLBScoerBar
//
//  Created by Connor Schembor on 7/7/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if #available(OSX 10.12.1, *) {
          NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

