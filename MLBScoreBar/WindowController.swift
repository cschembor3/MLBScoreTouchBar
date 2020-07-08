//
//  WindowController.swift
//  MLBScoerBar
//
//  Created by Connor Schembor on 7/7/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import AppKit

class WindowController: NSWindowController {
    @available(OSX 10.12.2, *)
      override func makeTouchBar() -> NSTouchBar? {
      guard let viewController = contentViewController as? MLBScoreViewController else {
        return nil
      }
      return viewController.makeTouchBar()
    }
}

extension NSTouchBar.CustomizationIdentifier {
    static let mlbScoreBar = NSTouchBar.CustomizationIdentifier("com.mlbscoretouchbar")
}

extension NSTouchBarItem.Identifier {
    static let mlbScoreItem = NSTouchBarItem.Identifier("com.mlbscoretouchbar.gameitem")
}
