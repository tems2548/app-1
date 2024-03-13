//
//  Record.swift
//  app-1
//
//  Created by admin on 3/13/24.
//

import Foundation
import SwiftData

struct Store {
    var records: [Record]
    var bestRecord: BestRecord
    
    init(records: [Record], bestRecord: BestRecord) {
        self.records = records
        self.bestRecord = bestRecord
    }
}

struct Record: Codable {
    var showTime: String
    var moveCount: Int
}

struct BestRecord: Codable {
    var bestTimeRecord: Record?
    var bestMoveCountRecord: Record?
}

func loadStore() -> Store {
    
}

func setStore(val: Store) {
    
}
