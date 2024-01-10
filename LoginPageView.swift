//
//  LoginPageView.swift
//  Daily Horoscope
//
//  Created by Utku Urkun on 9.01.2024.
//

import SwiftUI

struct LoginPageView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var shouldNavigate = false

    var body: some View {
        NavigationView {
            VStack {
                Image("lunaris logo")// Placeholder for logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
                    .padding(.bottom, 50)

                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button(action: {
                    // Check if both fields are "Lunaris"
                    if self.email == "Lunaris" && self.password == "Lunaris" {
                        self.shouldNavigate = true
                    }
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.purple)
                        .cornerRadius(15.0)
                }
                .padding(.bottom, 20)
                // NavigationLink that is activated when shouldNavigate is true
                NavigationLink(destination: TabViewPage(), isActive: $shouldNavigate) { EmptyView() }
                NavigationLink(destination: RegisterPageView()) {
                                    Text("Register")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 220, height: 60)
                                        .background(Color.purple)
                                        .cornerRadius(15.0)
                                }
                Text("Reset Password")
                    .padding()
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome! You are logged in.")
            .font(.largeTitle)
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
