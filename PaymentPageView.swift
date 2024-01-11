//
//  PaymentPageView.swift
//  Daily Horoscope
//
//  Created by Utku Urkun on 10.01.2024.
//

import SwiftUI

struct PayPalPaymentView: View {
    @Binding var isBirthChartPaid: Bool
    @State private var isPaymentSuccessful = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Unlock the Secrets of Your Stars")
                .font(.largeTitle)
                .padding(.top, 20)

            Image(systemName: "creditcard") // Placeholder for PayPal logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 50)
                .padding(.bottom, 20)

            Text("Embark on a Cosmic Journey!")
                .font(.headline)
                .padding(.bottom, 5)

            Text("Pay €7.99 single time for Your Personalized Birth Chart Analysis")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                            // Placeholder action for payment integration
                            self.isPaymentSuccessful = true
                            
                            // Add a delay of 1.5 seconds before dismissing the sheet
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                presentationMode.wrappedValue.dismiss()
                                
                                isBirthChartPaid = true
                            }
                        })  {
                Text("Pay with PayPal")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.purple)
                    .cornerRadius(15.0)
            }
            .padding(.bottom, 20)
            
            NavigationLink(destination: TabViewPage(), isActive: $isPaymentSuccessful) { EmptyView() }
            if isPaymentSuccessful {
                Text("Payment Successful! Prepare to Explore the Stars.")
                    .foregroundColor(.green)
            }
            
        }
        .padding()
    }
}

struct PayPalPaymentView_Previews: PreviewProvider {
    @State static var isBirthChartPaid: Bool = false

    static var previews: some View {
        PayPalPaymentView(isBirthChartPaid: $isBirthChartPaid)
    }
}
