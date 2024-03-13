//
//  BestRecord.swift
//  app-1
//
//  Created by admin on 3/13/24.
//

import Foundation

struct BestRecord: Codable {
    var records: [Record?]
    
    init() {
        self.records = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    }
    
    func stringTime(_ difficulty: Int) -> String {
        if self.records[difficulty] == nil {
            return "None"
        }
        return String(format: "%.2f", self.records[difficulty]!.time)
    }
    
    func stringMoveCount(_ difficulty: Int) -> String {
        if self.records[difficulty] == nil {
            return "None"
        }
        return String(self.records[difficulty]!.moveCount)
    }
    
    static func loadBestRecord() -> BestRecord {
        let defaultBestRecord = BestRecord()
        
        var bestRecord = defaultBestRecord
        if let data = UserDefaults.standard.data(forKey: "bestRecord") {
            let result = JSONManager.decodeJSON(data, defaultValue: defaultBestRecord)
            if result.error != nil {
                return defaultBestRecord
            }
            
            bestRecord = result.value
        }
        
        return bestRecord
    }

    static func saveBestRecord(bestRecord: BestRecord) throws {
        let encoded = try JSONManager.encodeJSON(bestRecord)
        
        UserDefaults.standard.set(encoded, forKey: "bestRecord")
    }
}

struct Record: Codable {
    var time: Float
    var moveCount: Int
}
