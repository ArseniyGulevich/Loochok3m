import SwiftUI

struct AuthScreen: View {
    @StateObject private var viewModel = AuthViewModel()
    @Binding var navigationState: NavigationState
    @Binding var errorState: ErrorState
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var secretResponse = ""
    @State private var isLoginEnabled = true
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack(spacing: 20) {
                    
                    // Login Screen
                    if viewModel.showLogin {
                        TextField("User name", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onAppear {
                                username = ""
                                password = ""
                                secretResponse = ""
                            }
                        PasswordTextField("Password", text: $password, isSecure: !isPasswordVisible)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay (
                                HStack {
                                    Spacer()
                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.trailing, 8)
                                }
                            )
                        
                        Button {
                            viewModel.showReset = true
                            viewModel.showLogin = false
                        } label: {
                            Text("Reset password")
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 5)
                                    
                                )
                        }
                        
                        Button(action: {
                            //                            viewModel.login(username: username, password: password)
                            viewModel.signinUser(username: username, password: password, completion: {
                                response in
                                print("Login")
                                print(response.token)
                                if response.id > 0  {
                                    print("ok.")
                                }
                            })
                        }, label: {
                            Text("Login")
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 5)
                                    
                                )
                        })
                    }
                    
                    // Reset password and registration screen
                    if (viewModel.showRegister || viewModel.showReset) {
                        TextField("User name", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onAppear {
                                username = ""
                                password = ""
                                secretResponse = ""
                            }
                        PasswordTextField("Password", text: $password, isSecure: !isPasswordVisible)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.trailing, 8)
                                }
                            )
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Answer the secret question", text: $secretResponse)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Defining the button Register
                        if (viewModel.showRegister) {
                            Button {
//                                viewModel.register(username: username, password: password, questionResponse: secretResponse)
                                
                                viewModel.signupUser(username: username, password: password, email: email, secretResponse: secretResponse, completion: {
                                    response in
                                    print("Register")
                                    print(response.token)
                                    if response.id > 0  { print("ok.") }
                                })
                            } label: {
                                Text("Register")
                                    .font(.system(size: 25, weight: .bold))
                                    .frame(width: 200, height: 50)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 5)
                                    )
                            }
                        }
                        
                        // Defining the button Reset
                        if (viewModel.showReset) {
                            Button(action: {
//                                viewModel.resetPassword(username: username, password: password, questionResponse: secretResponse)
                                viewModel.resetPasswordAPI(username: username, email: email, password: password, secretResponse: secretResponse, completion: {
                                    response in
                                    print("Reset Password")
                                    print(response.token)
                                    if response.id > 0  { print("ok.")
                                    }
                                })
                            }) {
                                Text("Reset")
                                    .font(.system(size: 25, weight: .bold))
                                    .frame(width: 200, height: 50)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 5)
                                    )
                            }
                        }
                    }
                    
                    if (viewModel.showLogin || viewModel.showRegister || viewModel.showReset) {
                        Button (action: {
                            viewModel.showLogin = false
                            viewModel.showRegister = false
                            viewModel.showReset = false
                        }) {
                            Text("Back")
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 200, height: 50)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    } else {
                        // Main auth screen
                        Button(action: {
                            viewModel.showLogin = true
                        }) {
                            Text("Login")
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 200, height: 50)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            viewModel.showRegister = true
                        }) {
                            Text("Register")
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .overlay(                     RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 5)
                                )
                        }
                    }
                    //}
                } // VStack
                .padding().onReceive(viewModel.$isSuccessAuth) {
                    isSuccess in
                    if isSuccess == true {
                        print("Auth finished.")
                        navigationState = .Main
                    }
                }
            }
            .navigationTitle("Auth")
        }
        .onReceive(viewModel.$errorState, perform: { newState in
            if case .Success(_) = errorState {
                if case .None = errorState {
                    return
                }
            }
            withAnimation {
                errorState = newState
            }
        })
        .onTapGesture {
            endEditing()
        }
        
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}
