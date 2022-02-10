//
//  TodoView.swift
//  Todo
//
//  Created by Killian on 10/02/2022.
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject var model: ViewModel
    let todo: Todo
    
    var body: some View {
        VStack(){
            ScrollView(){
                Text(todo.content ?? "Content")
                    .padding()
            }
            Spacer()
            if todo.important ?? false{
                Text("Important")
                    .padding()
                    .background(Color.red)
            }
        }
        .navigationTitle(todo.title ?? "Title")
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todo: Todo()).environmentObject(ViewModel())
    }
}
