//
//  LoginView.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var mail = "test@test.fr"
    @State var password = "testtest"
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack{
            if let errorMessage = model.errorMessage{
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
            VStack(){
                Text("Log In")
                    .font(.title)
                    .padding()
                Text("Access your Todo list")
                    .font(.title2)
                    .padding()
                Spacer()
                HStack {
                    VStack{
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    VStack{
                        VStack(alignment: .leading){
                            Text("Email:")
                                .font(.title3)
                            TextField("Enter an email", text: $mail)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding()
                        VStack(alignment: .leading){
                            Text("Password:")
                                .font(.title3)
                            SecureField("Enter password", text: $password)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding()
                        Button("Log In", action: {
                            model.login(mail: mail, password: password)
                        })
                            .buttonStyle(.bordered)
                            .font(.title3)
                    }
                    VStack{
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
