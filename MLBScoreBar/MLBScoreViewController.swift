//
//  ViewController.swift
//  MLBScoerBar
//
//  Created by Connor Schembor on 7/7/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

class MLBScoreViewController: NSViewController {
    
}

@available(OSX 10.12.1, *)
extension MLBScoreViewController: NSTouchBarDelegate {
    
  override func makeTouchBar() -> NSTouchBar? {
    let touchBar = NSTouchBar()
    touchBar.delegate = self
    touchBar.customizationIdentifier = .mlbScoreBar
    touchBar.defaultItemIdentifiers = [.mlbScoreItem]
    touchBar.customizationAllowedItemIdentifiers = [.mlbScoreItem]
    return touchBar
  }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.mlbScoreItem:
          let scoreScrubber = NSScrubber()
          let scoreItem = NSCustomTouchBarItem(identifier: identifier)
          let itemLayout = NSScrubberFlowLayout()
          itemLayout.itemSpacing = 20
          itemLayout.itemSize = NSSize(width: 70, height: 30)
          scoreScrubber.scrubberLayout = itemLayout
          scoreScrubber.mode = .free
          scoreScrubber.itemAlignment = .leading
          let scoreScrubberSource = ScoreScrubberSource()
          scoreScrubber.delegate = scoreScrubberSource
          scoreScrubber.dataSource = scoreScrubberSource
          scoreItem.view = scoreScrubber
          return scoreItem
        default:
          return nil
        }
    }
}
