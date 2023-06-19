//
//  StarsignPickerView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 19/6/2023.
//

import Foundation
import SwiftUI

struct StarsignPickerView: View {

    var model = HoroscopeViewModel()

    var body: some View {
        VStack {
            if model.isLoading {
                ProgressView()
            } else {
                HoroscopeTextView(text: model.currentHoroscopeText)
                    .padding()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Starsign.allCases) { sign in
                        Button {
                            Task {
                                await model.getHoroscope(for: sign)
                            }
                        } label: {
                            StarsignIconView(sign: sign)
                                .frame(width: 100)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }

}

enum Starsign: String, CaseIterable, Identifiable {
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricon, aquarius, pisces

    var id: String {
        return self.rawValue
    }

    var constellation: String {
        return self.rawValue
    }
}

struct HoroscopeTextView: View {

    let text: String

    var body: some View {
        VStack {
            TextEditor(text: .constant(text))
                .font(.headline)
        }
    }

}

struct StarsignIconView: View {

    let sign: Starsign

    var body: some View {
        VStack {
            Image(systemName: "xmark")
            Text(sign.rawValue)
        }
    }

}

#Preview {
    StarsignPickerView()
}
