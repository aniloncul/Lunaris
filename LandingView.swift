//
//  LandingView.swift
//  Daily Horoscope
//
//  Created by Utku Urkun on 8.01.2024.
//

import SwiftUI
 
struct LandingView: View {
     
    var body: some View {
        
        ZStack {
            Image("lunaris logo").resizable().aspectRatio(contentMode: .fit).edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .bottom, endPoint: .top))
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing :29) {
                Text("Lunaris").font(.title).fontWeight(.heavy)
                Spacer()
                VStack {
                    Text("Learn Your Destiny").font(.system(size: 30, design: .monospaced)).fontWeight(.heavy)
                }.padding(.vertical, 20)
                
                Text("Check out your Birth Chart Analysis")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: LoginPageView()){
                    Button(action: {}) {
                        Text("Let's Start").padding()
                    }.frame(width:300).background(Color.purple)
                    .padding(.bottom, 10)}
            }.frame(width: UIScreen.main.bounds.width - 40)
                .foregroundColor(.white)
        }
        .navigationBarHidden(true)
    }
}
 
struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
