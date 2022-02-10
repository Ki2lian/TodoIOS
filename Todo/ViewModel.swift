//
//  ViewModel.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import Foundation
import Combine
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var todos = [Todo]()
    @Published var isPresented = false
    
    var listener: ListenerRegistration?
    var subscription: AnyCancellable?
    let collection = Firestore.firestore().collection("Todo")
    
    init() {
        subscription = $user.sink(receiveValue: { [weak self] user in
            self?.setListener(user: user)
        })
    }
}


// Firebase management

extension ViewModel {
    func login(mail: String, password: String){
        Auth.auth().signIn(withEmail: mail, password: password) { authResult, error in
            self.user = authResult?.user
            self.errorMessage = error?.localizedDescription
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            errorMessage = .none
            user = .none
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func snapshotListener(querySnapshot: QuerySnapshot?, error: Error?) {
        if let error = error {
            errorMessage = error.localizedDescription
        }
        collection.whereField("uid", isEqualTo: user?.uid ?? "")
            .getDocuments() { (querySnapshot, err) in
                if let documents = querySnapshot?.documents {
                    print("Documents: \(documents)")
                    do {
                        self.todos = try documents.compactMap({ document in
                            let todo = try document.data(as: Todo.self)
                            return todo
                       })
                    } catch {
                        self.errorMessage = error.localizedDescription
                    }
                }
        }
    }
    
    func setListener(user: User?) {
        if let existingListener = listener {
            existingListener.remove()
            print("Existing listener removed")
            listener = .none
            todos = []
        }

        if let user = user {
            listener = collection.addSnapshotListener { [weak self] (querySnapshot, error) in
                self?.snapshotListener(querySnapshot: querySnapshot, error: error)
            }
            print("Listener added for \(user.uid)")
        }
    }
    
    func addTodo(title: String, content: String, isImportant: Bool){
        let now = Date()
        let todo = Todo(title: title, uid: user?.uid, content: content, important: isImportant, createdAt: now, updatedAt: now)
        
        do {
            let _ = try collection.addDocument(from: todo)
            print("Todo added")
            isPresented = false
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeTodo(at offsets: IndexSet){
        offsets.forEach({ index in
            let id = todos[index].id
            collection.document(id ?? "").delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Todo successfully removed!")
                }
            }
        })
        //todos.remove(atOffsets: offsets)
    }
}

