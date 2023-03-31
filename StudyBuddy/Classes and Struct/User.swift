//
//  User.swift
//  StudyBuddy
//
//  Created by School-Aj on 2023-03-29.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Decodable {
    @DocumentID var id: String?
    let username, password : String
    init(data: [String: Any]) {
        self.username = data["username"] as? String ?? ""
        self.password = data["password"] as? String ?? ""
    }
}

let db = Firestore.firestore()

func submitUser(user: User) {
    if user.username == "" {
        return
    }
//    let JSON = """
//{
//    "username": "\(user.username)",
//    "password": "\(user.password)
//}
//"""
    db.collection("users").document(user.username).setData([
        "username": user.username,
        "password": user.password
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Success!")
        }
    }
}

//func getUser(user: User) {
//    let docRef = db.collection("users").document(user.username)
//    docRef.getDocument(as: User.self) { result in
//        switch result {
//        case .success(let user):
//            print("User: \(user.username)")
//            print("Hello")
//        case .failure(let error):
//            print("Error \(result)")
//        }
//    }
//    docRef.getDocument { (doc, error) in
//        if let document = doc, document.exists {
//            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//            print("Document data: \(dataDescription)")
//            print(type(of: dataDescription))
//        } else {
//            print("Document does not exist")
//        }
//
//    }
//}
//class a: Codable, Identifiable {
//
//    var name, password: String
//    init(name: String, password: String) {
//        self.name = name
//        self.password = password
//    }
//
//
//
//    func getUser(user: User) {
//        if user.name == "" {
//            return
//        }
//        let docRef = db.collection("users").document(user.name)
//
//        docRef.getDocument() {
//        }
//        docRef.getDocument { (doc, error) in
//            if let document = doc, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//                print(type(of: dataDescription))
//            } else {
//                print("Document does not exist")
//            }
//
//        }
//    }
//
//    func deleteUser(user: User) {
//        if user.name == "" {
//            return
//        }
//        let db = Firestore.firestore()
//        db.collection("users").document(user.name).delete() { err in
//            if let err = err {
//                print("Error removing document: \(err)")
//            } else {
//                print("Document successfully removed!")
//            }
//        }
//    }
//
//    func updateUser(user: User) {
//        if user.name == "" {
//            return
//        }
//        let db = Firestore.firestore()
//        db.collection("users").document(user.name).updateData([
//            "password": user.password
//        ]) { err in
//            if let err = err {
//                print("Error updating password: \(err)")
//            } else {
//                print("Password Updated!")
//            }
//        }
//    }
//    func getCourses() {
//
//    }
//    //    var classes: Array<Classes> = Array()
//
////    func setName(name: String) {
////        name = name
////    }
////    func setPassword(password: String) {
////        // hash
////        var hashedPassword = password
////        password = password
////    }
//}
