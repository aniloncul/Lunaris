//
//  DailyHoroscopeView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 19/6/2023.
//

import Foundation
import SwiftUI

struct DailyHoroscopeView: View {

    @AppStorage("starsign") var starsign: Starsign?
    @AppStorage("tone") var tone: GPTTone = .friendly
    @Environment(\.dismiss) var dismiss
    var model = HoroscopeViewModel()

    @State var showDashboard = false

    var body: some View {
        VStack {
            if model.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    Text(model.currentHoroscopeText)
                        .padding()
                }
            }
        }
        .navigationTitle(Text("Daily Horoscope"))
        .background(
            LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
        )
        .onAppear {
            if let starsign {
                getHoroscope(for: starsign)
            }
        }

    }

    func getHoroscope(for starsign: Starsign) {
        Task {
            await model.getHoroscope(for: starsign, tone: tone)
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
    DailyHoroscopeView()
}
