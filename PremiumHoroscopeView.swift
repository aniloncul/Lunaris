//
//  DailyHoroscopeView.swift
//  Lunaris
//
//  Created by Anıl Öncül on 11.01.2024.
//

import SwiftUI
import StoreKit

public struct PremiumHoroscopeView: View {
    @AppStorage("starsign") var starsign: Starsign?
    @State var showPremium: Bool = false
    @Binding var isPremium: Bool
    @State var showPaywall: Bool = false
    @State var showStarsignInfo: Bool = false
    @State var isBirthChartPaid: Bool = false
    @State var showBirthChart: Bool = false
    
    public var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Spacer()
                                .frame(height: 64)
                            
                            Text(isPremium ? "You are on premium plan." : "You are on basic plan. In order to see daily horoscope please get the premium plan.")
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                                .multilineTextAlignment(.leading)
                                .font(
                                    .system(size: 24,
                                            weight: .regular
                                           )
                                )
                        }
                            
                            
                            
                            Spacer()
                                .frame(height: 48)
                            
                            if !isBirthChartPaid {
                                Button(action: {
                                    showPremium = true
                                    
                                }, label: {
                                    DashboardTile(title: "Get Premium Plan", systemName: "sparkles")
                                })
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                            } else {
                                
                            }
                            
                        
                        
                        Spacer()
                            .frame(height: 32)
                        
                     
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("lunaris logo")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text(isPremium ? "Premium" : "Basic")
                        .foregroundColor(isPremium ? .purple : .green)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(isPremium ? Color.purple : Color.green, lineWidth: 2)
                        )
                }
                
                
                
            }
            .background(
                Image("background")
                    .resizable()
                    .scaledToFill()
            )
            .sheet(isPresented: $showPremium) {
                PremiumPayWall(isPremium: $isPremium)
            }
         
            }
        }
    }


