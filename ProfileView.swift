import SwiftUI
import StoreKit

struct ProfileView: View {
    @AppStorage("starsign") var starsign: Starsign?
    @State var isPremium: Bool 
    @State var showPaywall: Bool = false
    @State var showStarsignInfo: Bool = false
    @State var isBirthChartPaid: Bool = false
    @State var showBirthChart: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 16) {
//                            Text("Alexis")
//                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
//                                .multilineTextAlignment(.leading)
//                                .font(
//                                    .system(size: 40,
//                                            weight: .thin
//                                           )
//                                )
                            Spacer()
                                .frame(height: 64)
                            
                            Text(isBirthChartPaid ? "You may find your personalized Birth Chart Analysis below." : "In order to see your personalized Birth Chart Analysis you should pay a single time payment.")
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                                .multilineTextAlignment(.leading)
                                .font(
                                    .system(size: 24,
                                            weight: .regular
                                           )
                                )
                            
                            Spacer()
                                .frame(height: 2)
                            
                            if !isBirthChartPaid {
                                Button(action: {
                                    showPaywall = true
                                    
                                }, label: {
                                    DashboardTile(title: "Buy Birth Chart Analysis", systemName: "sparkles")
                                })
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                            } else {
                                Button(action: {
                                    
                                    showBirthChart = true
                                }, label: {
                                    DashboardTile(title: "See Your Birth Chart Analysis", systemName: "sparkles")
                                })
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                            }
                            
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
            
            .sheet(isPresented: $showPaywall) {
                PayPalPaymentView(isBirthChartPaid: $isBirthChartPaid)
            }
            .sheet(isPresented: $showBirthChart) {
                BirthChartView()
            }
        }
        
    }
}
    
//    struct ProfileView_Previews: PreviewProvider {
//        @State static var isBirthChartPaid: Bool = false
//        static var previews: some View {
//            
//            NavigationView {
//                ProfileView(isBirthChartPaid: isBirthChartPaid)
//                    .navigationTitle("Profile")
//            }
//        }
//    }
//}
