//
//  LoginView.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var mail = ""
    @State var password = ""
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack{
            if let errorMessage = model.errorMessage{
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
            VStack(alignment: .leading){
                Text("Email:")
                    .font(.system(size: 12, weight: .heavy))
                TextField("Enter an email", text: $mail)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                Text("Password:")
                    .font(.system(size: 12, weight: .heavy))
                SecureField("Enter password", text: $password)
            }
            
            Button("Connect", action: {
                model.login(mail: mail, password: password)
            })
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
