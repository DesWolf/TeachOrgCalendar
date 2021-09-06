//
//  DatabaseManager.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/1/21.
//

import Foundation
import FirebaseDatabase

enum DatabaseFolder: String {
    case users = "users"
    case students = "students"
    case events = "events"
    case userInfo = "userInfo"
}

protocol DatabaseManager: AnyObject {
    func loadListOfStudents()
    func student(id: String) -> Student
    func addStudent(student: Student) -> String
    func editStudent(student: Student)
    func deleteStudent(id: String)
    
    func loadListOfEvents()
    func event(id: String) -> Event
    func addEvent(event: Event) -> String
    func editEvent(event: Event)
    func deleteEvent(id: String)
}

final class DatabaseManagerImpl {
    private var ref = Database.database().reference()
    private let authManager: AuthManager
    private let databaseNotifier: DatabaseNotifier
    
    private var listOfstudents: [Student]?
    
    init(authManager: AuthManager,
         databaseNotifier: DatabaseNotifier) {
        self.authManager = authManager
        self.databaseNotifier = databaseNotifier
    }
    
}

extension DatabaseManagerImpl: DatabaseManager {
    
    // MARK: - Student
    
    func loadListOfStudents() {
        ref.child(DatabaseFolder.users.rawValue)
            .child(authManager.userUID)
            .child(DatabaseFolder.students.rawValue)
            .observe(.value) { snapshot in
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
                self.listOfstudents = students
            self.databaseNotifier.listOfStudents(list: students)
        }
    }
    
    func student(id: String) -> Student {
        if let student = listOfstudents?.filter({ $0.id == id }).first {
            return student
        } else {
            return Student()
        }
    }
    
    func addStudent(student: Student) -> String {
        guard let newId = ref.child(DatabaseFolder.users.rawValue)
                .child(authManager.userUID)
                .child(DatabaseFolder.students.rawValue)
                .childByAutoId()
                .key else {
            return ""
        }
        
        let object: [String: Any] = ["id": newId,
                                     "name": student.name ?? "",
                                     "surname": student.surname ?? "",
                                     //"disciplines": student.disciplines ?? [""],
                                     "phone": student.phone ?? "",
                                     "email": student.email ?? "",
                                     "note": student.note ?? ""
        ]
        ref.child(DatabaseFolder.users.rawValue)
            .child(authManager.userUID)
            .child(DatabaseFolder.students.rawValue)
            .child(newId)
            .setValue(object)
        
        return newId
    }
    
    func deleteStudent(id: String) {
        ref.child(DatabaseFolder.users.rawValue)
            .child(authManager.userUID)
            .child(DatabaseFolder.students.rawValue)
            .child(id)
            .removeValue()
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

        ref.child(DatabaseFolder.users.rawValue)
            .child(authManager.userUID)
            .child(DatabaseFolder.students.rawValue)
            .child(id)
            .updateChildValues(childUpdates)
    }
    
    // MARK: - Event
    
    func loadListOfEvents() {
        
    }
    
    func event(id: String) -> Event {
        return Event()
    }
    
    func addEvent(event: Event) -> String {
        return ""
    }
    
    func editEvent(event: Event) {
        
    }
    
    func deleteEvent(id: String) {
        
    }
}
