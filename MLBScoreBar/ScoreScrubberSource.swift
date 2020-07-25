//
//  ScoreScrubberSource.swift
//  MLBScoreBar
//
//  Created by Connor Schembor on 7/12/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

class ScoreScrubberSource: NSObject, NSScrubberDelegate, NSScrubberDataSource {
    func numberOfItems(for scrubber: NSScrubber) -> Int {
        3
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
