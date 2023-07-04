//
//  GPTTone.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 4/7/2023.
//

import Foundation

enum GPTTone: String, CaseIterable, Identifiable {
    case formal
    case friendly
    case chill
    case obnoxious
    case excessiveProfanity = "excessive profanity"

    var id: String {
        return self.rawValue
    }
}
