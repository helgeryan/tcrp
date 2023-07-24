//
//  RegistrationView.swift
//  fireSwiftUI
//
//  Created by Ryan Helgeson on 7/18/23.
//

import SwiftUI


struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var confirmPassword = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                // Image
                Image("mobiusStrip").resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 32)
                // Form fields
                VStack {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com").autocapitalization(.none)
                    InputView(text: $fullname, title: "Name", placeholder: "Enter your name").autocapitalization(.none)
                    InputView(text: $password, title: "Password", placeholder: "name@example.com", isSecureField: true)
                    ZStack(alignment: .trailing) {
                        InputView(text: $confirmPassword, title: "Confirm password", placeholder: "Enter your password", isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                // Sign in
                
                Button {
                    print("Sign user up..")
                    Task {
                        try await viewModel.createUser(email: email, password: password, fullname: fullname)
                    }
                } label: {
                    HStack {
                        Text("Sign Up").fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                
                Spacer()
                // Sign Up Button
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign in").fontWeight(.bold)
                    }.font(.system(size: 14))
                }
            }
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && !fullname.isEmpty && password.count > 5 && password == confirmPassword
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
