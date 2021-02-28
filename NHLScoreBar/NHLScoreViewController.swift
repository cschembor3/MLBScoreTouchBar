//
//  ViewController.swift
//  NHLScoreBar
//
//  Created by Connor Schembor on 7/7/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

class NHLScoreViewController: NSViewController, NSScrubberDelegate, NSScrubberDataSource {
    
    func numberOfItems(for scrubber: NSScrubber) -> Int {
        3
    }
    
    func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
        let scoreView = NSScrubberItemView()
        let team1Label = NSTextField(labelWithString: "NJD: 6")
        let team2Label = NSTextField(labelWithString: "PHI: 0")
        scoreView.addSubview(team1Label)
        scoreView.addSubview(team2Label)
        team1Label.font = NSFont(name: "System", size: 10)
        team1Label.snp.makeConstraints { (make) in
            make.top.equalTo(scoreView.snp.top)
            make.leading.equalTo(scoreView.snp.leading).offset(4)
        }
        
        team2Label.font = NSFont(name: "System", size: 10)
        team2Label.snp.makeConstraints { (make) in
            make.bottom.equalTo(scoreView.snp.bottom)
            make.leading.equalTo(team1Label.snp.leading)
        }
        
        scoreView.wantsLayer = true
        scoreView.layer?.backgroundColor = NSColor.controlColor.cgColor
        scoreView.layer?.cornerRadius = 4
        return scoreView
    }
}

@available(OSX 10.12.1, *)
extension NHLScoreViewController: NSTouchBarDelegate {
    
  override func makeTouchBar() -> NSTouchBar? {
    let touchBar = NSTouchBar()
    touchBar.delegate = self
    touchBar.customizationIdentifier = .nhlScoreBar
    touchBar.defaultItemIdentifiers = [.nhlScoreItem]
    touchBar.customizationAllowedItemIdentifiers = [.nhlScoreItem]

    //let s = NHLScoreService()
    //s.makeRequest()

    return touchBar
  }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.nhlScoreItem:
          let scoreScrubber = NSScrubber()
          let scoreItem = NSCustomTouchBarItem(identifier: identifier)
          let itemLayout = NSScrubberFlowLayout()
          itemLayout.itemSpacing = 20
          itemLayout.itemSize = NSSize(width: 70, height: 30)
          scoreScrubber.scrubberLayout = itemLayout
          scoreScrubber.mode = .free
          scoreScrubber.itemAlignment = .leading
          //let source = ScoreScrubberSource()
          //scoreScrubber.delegate = source
          //scoreScrubber.dataSource = source
          scoreItem.view = scoreScrubber
          return scoreItem
        default:
          return nil
        }
    }
}
