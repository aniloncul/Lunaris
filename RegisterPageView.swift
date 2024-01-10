import SwiftUI

struct RegisterPageView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var birthDate = Date()
    @State private var birthPlace = ""
    @State private var birthTime = Date()
    @State private var password = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Register")
                    .font(.largeTitle)
                    .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)

                TextField("Full Name", text: $fullName)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)

                DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)

                TextField("Birth Place", text: $birthPlace)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)

                DatePicker("Birth Time", selection: $birthTime, displayedComponents: .hourAndMinute)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)

                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)

                NavigationLink(destination: PayPalPaymentView()) {
                                    Text("Payment")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 220, height: 60)
                                        .background(Color.purple)
                                        .cornerRadius(15.0)
                                }
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
