//
//  HomeView.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack{
            if let user = model.user{
                Text("Hello, \(user.uid)")
                /*List(model.items) { item in
                    let name = item.name ?? "No name"
                    Text("Item: \(name)")
                }*/
            } else {
                LoginView()
            }
            
            if let errorMessage = model.errorMessage{
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
