//
//  WindowController.swift
//  NHLScoreBar
//
//  Created by Connor Schembor on 7/7/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import AppKit

class WindowController: NSWindowController {
    @available(OSX 10.12.2, *)
      override func makeTouchBar() -> NSTouchBar? {
      guard let viewController = contentViewController as? NHLScoreViewController else {
        return nil
      }
      return viewController.makeTouchBar()
    }
}

extension NSTouchBar.CustomizationIdentifier {
    static let nhlScoreBar = NSTouchBar.CustomizationIdentifier("com.nhlscoretouchbar")
}

extension NSTouchBarItem.Identifier {
    static let nhlScoreItem = NSTouchBarItem.Identifier("com.nhlscoretouchbar.gameitem")
}
