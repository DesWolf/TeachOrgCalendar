//
//  DatabaseManager.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/1/21.
//

import Foundation
import FirebaseDatabase

protocol DatabaseManager: AnyObject {
    func loadListOfStudents()
    
    func addStudent(student: Student)
    func editStudent(student: Student)
    func deleteStudent(id: String)
}

final class DatabaseManagerImpl {
    private var ref = Database.database().reference()
    private let authManager: AuthManager
    private let databaseNotifier: DatabaseNotifier
    
    init(authManager: AuthManager,
         databaseNotifier: DatabaseNotifier) {
        self.authManager = authManager
        self.databaseNotifier = databaseNotifier
    }
    
}

extension DatabaseManagerImpl: DatabaseManager {
    func loadListOfStudents() {
        ref.child(authManager.userUID).observe(.value) { snapshot in
            guard let values = snapshot.value as? [String: [String: Any]] else {
                self.databaseNotifier.listOfStudents(list: [])
                return
                
            }
            var students: [Student] = []
            
            values.forEach { (id, data) in
                var student = Student()
                
                student.id = id
                student.name = data["name"] as? String
                student.surname = data["surname"] as? String
                student.disciplines = data["disciplines"] as? [String]
                student.phone = data["phone"] as? String
                student.email = data["email"] as? String
                student.note = data["note"] as? String
                
                students.append(student)
            }
            
            self.databaseNotifier.listOfStudents(list: students)
        }
    }
    
    
    func addStudent(student: Student) {
        let object: [String: Any] = ["name": student.name ?? "",
                                     "surname": student.surname ?? "",
                                     //"disciplines": student.disciplines ?? [""],
                                     "phone": student.phone ?? "",
                                     "email": student.email ?? "",
                                     "note": student.note ?? ""
                                    ]
        
        ref.child(authManager.userUID).childByAutoId().setValue(object)
    }
    
    func deleteStudent(id: String) {
        ref.child(authManager.userUID).child(id).removeValue()
    }
    
    func editStudent(student: Student) {
        guard let id = student.id else {
            return
        }
        
        let childUpdates = ["name": student.name ?? "",
                            "surname": student.surname ?? "",
                            //"disciplines": student.disciplines ?? [""],
                            "phone": student.phone ?? "",
                            "email": student.email ?? "",
                            "note": student.note ?? ""
                            ]

        ref.child(authManager.userUID).child(id).updateChildValues(childUpdates)
    }
}
