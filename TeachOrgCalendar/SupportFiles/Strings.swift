//
//  Strings.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

struct Strings {
    struct Common {
        static let conformButton = "Готово"
        static let cancelButton = "Отмена"
    }
    struct Login {
        static let greetingsTitle = "Добро пожаловать в TeachOrg"
        static let loginButton = "SignIn"
    }
    
    struct Students {
        static let title = "Ученики"
    }
    
    struct StudentProfile {
        static let namePlaceholder = "Имя"
        static let surnamePlaceholder = "Фамилия"
        static let disciplineTitle = "Занимается по предмету"
        static let phoneTitle = "Телефон"
        static let emailTitle = "Email"
        static let noteTitle = "Комментарий"
        static let edit = "Править"
        static let backButton = "Ученики"
    }
    
    struct EditStudent {
        static let newUserTitle = "Новый ученик"
        static let nameTitle = "Имя, Фимилия*"
        static let disciplineDescription = "Выберите один или несколько предметов, по которым занимается ученик"
        static let phonePlaceholder = "Введите телефон"
        static let emailPlaceholder = "Введите email"
        static let notePlaceholder = "Добавить комментарий"
        
        struct Error {
            static let emptyName = "Имя не может быть пустым"
            static let wrongPhone = "Введите корретный телефон"
            static let wrongEmail = "Введите корретный email"
        }
    }
    
    struct Errors {
        static let noInternetConnection = "Отсутствует интернет-соединение"
    }
}
