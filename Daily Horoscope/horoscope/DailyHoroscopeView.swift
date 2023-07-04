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
    @State var showOnboarding: Bool = false
    var model = HoroscopeViewModel()

    @State var showDashboard = false

    var body: some View {
        VStack {
            Button {
                showDashboard = true
            } label: {
                Text("show dashboard")
            }

            if model.isLoading {
                ProgressView()
            } else {
                HoroscopeTextView(text: model.currentHoroscopeText)
                    .padding()
                Spacer()
            }
        }
        .background(
            LinearGradient(colors: [.blue, .init(red: 0.2, green: 0.1, blue: 0.4)], startPoint: .top, endPoint: .bottom)
        )
        .onAppear {
            showOnboarding = starsign == nil
            if let starsign {
                getHoroscope(for: starsign)
            }
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView { starsign in
                getHoroscope(for: starsign)
            }
        }
        .sheet(isPresented: $showDashboard) {
            DashboardView()
        }
    }

    func getHoroscope(for starsign: Starsign) {
        Task {
            await model.getHoroscope(for: starsign, tone: tone)
        }
    }

}

struct HoroscopeTextView: View {

    let text: String

    var body: some View {
        VStack {
            Text(try! AttributedString(markdown: text))
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
    DailyHoroscopeView()
}
