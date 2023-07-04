//
//  Item.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 19/6/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
