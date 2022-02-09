//
//  ContentView.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ViewModel()
    
    var body: some View {
        if let _ = model.user{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person.fill")
                    }
            }.environmentObject(model)
        }else{
            LoginView()
                .environmentObject(model)
        }
        
        /*VStack{
            if let user = model.user{
                Text("Hello, \(user.uid)")
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
        .environmentObject(model)*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
