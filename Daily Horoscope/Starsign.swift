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

    var symbol: String {
        return self.rawValue
    }
    
    var horoscopeText: String {
            switch self {
            case .aries:
                return "Today's New Moon is the perfect opportunity for you to think about resolutions you might have considered for this new year. This particular New Moon urges you to think about your attitude to authority. (You are independent and self-reliant and might chafe at authority.)"
            case .taurus:
                return "Each New Moon is an opportunity to make resolutions and set intentions. Today is an excellent day to ask yourself what further training or education you could get that would improve your job or your career. Or what learning or travel might enrich and enhance your life?"
            case .gemini:
                return "The New Moon today is a lovely opportunity to take care of paperwork and unfinished business related to shared property, inheritances, taxes, debt and all that red tape stuff you like to avoid. Why not reduce some of it and enter this new year free of these niggling details?"
            case .cancer:
                return "Today the New Moon opposes your sign, and it will again on December 30 at the end of the year. Bookends for you. Each New Moon is the perfect opportunity to set intentions or make resolutions. This New Moon relates to partnerships and close friendships. Ideas?"
            case .leo:
                return "As this year begins, today is the perfect day to think about what you can do to improve your health, either by eating better or getting more exercise or both. Sometimes dropping a bad habit is a great benefit as well."
            case .virgo:
                return "The New Moon today is the right day to consider how you balance work and play in your life. Both are necessary. You want your life to be well-rounded with a good balance between duties and obligations versus free time. How is this working out for you?"
            case .libra:
                return "The New Moon today is an excellent chance to think about how to improve your relations with family members; as well as how to improve where you live so that you enjoy your home more. These are both important considerations for you."
            case .scorpio:
                return "We are gregarious creatures. We need to be seen, and we need to see others. We need to be heard, and we need to hear others. The New Moon today is a perfect time to think about how well you communicate to others, and how you might improve your communicating style?"
            case .sagittarius:
                return "Today's New Moon takes place in one of your Money Houses, which begs the question how are you handling your money? What about your spending habits? For that matter, how are you handling your possessions and taking care of them?"
            case .capricorn:
                return "Today's New Moon is in your sign, which is an excellent time to take a realistic look in the mirror and ask yourself what you can do to change your hair or your wardrobe so that you create a better impression on your world. Ideas? You value the respect of your peers."
            case .aquarius:
                return "The New Moon today is in a hidden part of your chart, which means this is an excellent day to think of how your childhood habits might trigger today's behaviour. Sometimes this is a good thing; sometimes not. A bit of navel gazing might reveal some truths."
            case .pisces:
                return "Today's New Moon is the perfect time to think about your friends. Your friends are important because they can influence the way you think; and in turn, the way you think is how you will make your choices - and your choices create your future."
            }
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
