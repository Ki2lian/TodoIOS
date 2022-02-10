//
//  AccountView`.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack{
            if let user = model.user{
                Spacer()
                Text("Hello, \(user.email ?? "user")")
                    .font(.title)
                Spacer()
                Button("Log out", action: {
                    model.logout()
                })
                    .buttonStyle(.bordered)
                    .font(.title2)
                Spacer()
            }
            
        }
        .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
