//
//  LoginView.swift
//  TalentExchange
//
//  Created by 임영후 on 2022/04/11.
//

import SwiftUI
import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore

    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
}

struct LoginView: View {
    
    let didCompletelogin: () -> ()

    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var shouldShowImagePicker = false

    var body: some View {
        ZStack{
            VStack{
            HStack {
                Text(isLoginMode ? "로그인" : "회원가입")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                Spacer()
            }
            

            VStack {
                VStack {

                VStack(spacing: 25) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("로그인")
                            .tag(true)
                        Text("회원가입")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())

                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()

                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
//                                } else {
//                                    Image(systemName: "person.fill")
//                                        .font(.system(size: 64))
//                                        .padding()
//                                        .foregroundColor(Color("color_primary"))
                                }
                            }
//                            .overlay(RoundedRectangle(cornerRadius: 64)
//                                        .stroke(Color("color_primary"), lineWidth: 1)
                            //)
                        }
                    }
                    

                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    .clipShape(Capsule())
                    Spacer()
                    Button {
                        handleAction()
                    } label: {
                        HStack() {
                            Spacer()
                            Text(isLoginMode ? "로그인" : "회원가입")
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color("color_primary"))
                            .clipShape(Capsule())

                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                
                }
                }
            }
            //.padding(.top, -30)//위로 올려두기......
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        
        }
    }
        .padding(.top)
        .padding(.horizontal)
    }
    
    
    @State var image: UIImage?
    @Environment(\.presentationMode) var presentationMode


    private func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            presentationMode.wrappedValue.dismiss()

            
//            print("Successfully logged in as user: \(result?.user.uid ?? "")")
//            
//            
//            
//            self.loginStatusMessage = "로그인 성공: \(result?.user.uid ?? "")"
//            
//            self.didCompletelogin()
        }
    }
    
    @State public var loginStatusMessage = ""
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "회원가입 성공: \(result?.user.uid ?? "")"
      //      self.persistImageToStorage()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didCompletelogin: {
        })
            .environmentObject(TabRouter())
    }
}
