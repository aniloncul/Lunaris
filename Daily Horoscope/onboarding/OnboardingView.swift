//
//  OnboardingView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 27/6/2023.
//

import Foundation
import SwiftUI
import SpriteKit

struct OnboardingView: View {

    @State var selectedDate: Date = .now
    @AppStorage("starsign") var starsign: Starsign?
    @AppStorage("dob") var dob: Double?
    @AppStorage("tone") var tone: GPTTone = .chill
    @Environment(\.dismiss) var dismiss
    private let scene = MeteorParticleScene(size: UIScreen.main.bounds.size)

    var body: some View {

        VStack(spacing: 0) {
            Text("When were you born?")
                .font(.title)
                .bold()
                .padding(.top, 30)

            DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) { oldValue, newValue in
                    starsign = Starsign.getZodiacSign(newValue)
                    dob = newValue.timeIntervalSince1970
                }
                .padding()

            HStack {
                Text("Set the tone")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                Spacer()
                Picker(selection: $tone) {
                    ForEach(GPTTone.allCases) { tone in
                        Text(tone.rawValue.capitalized)
                            .tag(tone)
                    }
                } label: {
                    Text("Tone")
                }
                .pickerStyle(.menu)
            }
            .padding(.horizontal)

            Spacer()
            if let starsign {
                VStack {
                    Text("Your star sign is")
                        .foregroundStyle(.secondary)
                    Text("\(starsign.rawValue)")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .textCase(.uppercase)
                        .transition(.slide)
                }
                .padding()
            }
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Continue")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(Capsule().foregroundStyle(.accent))
            }
            .buttonStyle(ScaleButtonStyle())
            .disabled(starsign == nil)
            .padding(.horizontal)
        }
        .background(
            ZStack {
                LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
                SpriteView(scene: scene, options: [.allowsTransparency])
                    .opacity(0.5)
            }
            .ignoresSafeArea()
        )
    }
}

#Preview {
    OnboardingView()
}
