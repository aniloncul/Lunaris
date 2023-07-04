//
//  DashboardView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 4/7/2023.
//

import Foundation
import SwiftUI
import StoreKit

struct DashboardView: View {

    @State var showPaywall: Bool = false

    var body: some View {
        NavigationStack {
            VStack {

                Spacer()
                Button(action: {
                    showPaywall = true
                }, label: {
                    Text("Purchase")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(15)
                        .background(Capsule().foregroundStyle(.accent))
                })
                .padding()
                Spacer()
            }
            .navigationTitle(Text("Dashboard"))
            .background(
                LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
            )
            .sheet(isPresented: $showPaywall, content: {
                StoreView(ids: ["PremiumMonthly", "PremiumQuarterly"])
            })
        }
        .ignoresSafeArea()
    }

}

#Preview {
    DashboardView()
}
