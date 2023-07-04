//
//  Starsign.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 27/6/2023.
//

import Foundation

enum Starsign: String, CaseIterable, Identifiable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces

    var id: Int {
        return Starsign.allCases.firstIndex(of: self)! + 1
    }

    var constellation: String {
        return self.rawValue
    }

    static func getZodiacSign(_ date: Date) -> Starsign {
        let calendar = Calendar.current
        let d = calendar.component(.day, from: date)
        let m = calendar.component(.month, from: date)

        switch (d,m) {
        case (21...31,1),(1...19,2):
            return .aquarius
        case (20...29,2),(1...20,3):
            return .pisces
        case (21...31,3),(1...20,4):
            return .aries
        case (21...30,4),(1...21,5):
            return .taurus
        case (22...31,5),(1...21,6):
            return .gemini
        case (22...30,6),(1...22,7):
            return .cancer
        case (23...31,7),(1...22,8):
            return .leo
        case (23...31,8),(1...23,9):
            return .virgo
        case (24...30,9),(1...23,10):
            return .libra
        case (24...31,10),(1...22,11):
            return .scorpio
        case (23...30,11),(1...21,12):
            return .sagittarius
        default:
            return .capricorn
        }
    }

}
