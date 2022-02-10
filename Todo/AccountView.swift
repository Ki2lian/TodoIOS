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
                Text("Hello, \(user.email ?? "user")")
                Button("Log out", action: {
                    model.logout()
                })
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
