//
//  Todo.swift
//  Todo
//
//  Created by Killian on 09/02/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Todo: Identifiable, Codable{
    @DocumentID var id: String?
    var title: String?
    var uid: String?
    var content: String?
    var important: Bool?
    var createdAt: Date?
    var updatedAt: Date?
}
