//
//  AddTodoView.swift
//  Todo
//
//  Created by Killian on 10/02/2022.
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject var model: ViewModel
    @State var title = ""
    @State var content = ""
    @State var isImportant = false
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Button("Close"){
                model.isPresented = false
            }
            .padding()
            .foregroundColor(.red)
            
            VStack{
                Text("Add a new To do")
                    .font(.title)
                    .padding()
                Divider()
                Spacer()
                VStack{
                    VStack(alignment: .leading){
                        Text("Title")
                            .font(.title3)
                        TextField("Title", text: $title)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    VStack(alignment: .leading){
                        Text("Content")
                            .font(.title3)
                        TextField("Content", text: $content)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    Toggle("Important", isOn: $isImportant)
                        .padding()
                    Button("Add"){
                        model.addTodo(title: title, content: content, isImportant: isImportant)
                    }
                        .buttonStyle(.bordered)
                        .font(.title3)
                }
                Spacer()
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView().environmentObject(ViewModel())
    }
}
