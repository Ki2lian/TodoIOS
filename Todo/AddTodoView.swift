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
                VStack(alignment: .leading){
                    Text("Title")
                    TextField("Title", text: $title)
                    
                    Text("Content")
                    TextField("Content", text: $content)
                    
                    Toggle("Important", isOn: $isImportant)
                }
                
                Button("Add"){
                    model.addTodo(title: title, content: content, isImportant: isImportant)
                }
                .padding()
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView().environmentObject(ViewModel())
    }
}
