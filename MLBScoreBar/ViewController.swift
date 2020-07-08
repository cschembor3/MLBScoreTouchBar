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
extension MLBScoreViewController: NSTouchBarDelegate, NSScrubberDelegate, NSScrubberDataSource {
    func numberOfItems(for scrubber: NSScrubber) -> Int {
        return 3
    }
    
    func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
        let scoreView = NSScrubberItemView()
        let team1Label = NSTextField(labelWithString: "NYM: 10")
        let team2Label = NSTextField(labelWithString: "NYY: 0")
        scoreView.addSubview(team1Label)
        scoreView.addSubview(team2Label)
        team1Label.font = NSFont(name: "System", size: 10)
        team1Label.snp.makeConstraints { (make) in
          make.top.equalTo(scoreView.snp.top)
        }
        
        team2Label.font = NSFont(name: "System", size: 10)
        team2Label.snp.makeConstraints { (make) in
          make.bottom.equalTo(scoreView.snp.bottom)
        }
        
        scoreView.wantsLayer = true
        scoreView.layer?.backgroundColor = NSColor.gray.cgColor
        scoreView.layer?.cornerRadius = 4
        return scoreView
    }
    
  override func makeTouchBar() -> NSTouchBar? {
    // 1
    let touchBar = NSTouchBar()
    touchBar.delegate = self
    // 2
    touchBar.customizationIdentifier = .mlbScoreBar
    // 3
    touchBar.defaultItemIdentifiers = [.infoLabelItem]
    // 4
    touchBar.customizationAllowedItemIdentifiers = [.infoLabelItem]
    return touchBar
  }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.infoLabelItem:
          let scoreScrubber = NSScrubber()
          let scoreItem = NSCustomTouchBarItem(identifier: identifier)
          let itemLayout = NSScrubberFlowLayout()
          itemLayout.itemSpacing = 20
          itemLayout.itemSize = NSSize(width: 70, height: 30)
          scoreScrubber.scrubberLayout = itemLayout
          scoreScrubber.mode = .free
          scoreScrubber.itemAlignment = .leading
          scoreScrubber.delegate = self
          scoreScrubber.dataSource = self
          scoreItem.view = scoreScrubber
          return scoreItem
        default:
          return nil
        }
    }
}
