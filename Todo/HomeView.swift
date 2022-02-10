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
        if let _ = model.user{
            NavigationView {
                List{
                    /*
                    NavigationLink(destination: TodoView(todo: todo)){
                        Text("\(todo.title ?? "Empty title")")
                    }*/
                    ForEach(model.todos, id: \.title){ todo in
                        NavigationLink(destination: TodoView(todo: todo)){
                            Text("\(todo.title ?? "Empty title")")
                        }
                    }
                    .onDelete(perform: model.removeTodo)
                }
                .navigationTitle("Todo list")
                .toolbar(){
                    Button {
                        model.isPresented = true
                    } label: {
                        Image(systemName: "plus.circle")
                            //.resizable()
                            //.frame(width: CGFloat(30), height: CGFloat(30))
                    }
                    //.padding()
                    //.frame(width: CGFloat(35), height: CGFloat(35))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .sheet(isPresented: $model.isPresented){
                    AddTodoView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
