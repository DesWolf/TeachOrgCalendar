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
    
    struct StudentProfile {
        static let newUserTitle = "Новый ученик"
        static let nameTitle = "Имя, Фимилия*"
        static let namePlaceholder = "Имя"
        static let surnamePlaceholder = "Фамилия"
        static let disciplineTitle = "Занимается по предмету"
        static let disciplineDescription = "Выберите один или несколько предметов, по которым занимается ученик"
        static let phoneTitle = "Телефон"
        static let phonePlaceholder = "Введите телефон"
        static let emailTitle = "Email"
        static let emailPlaceholder = "Введите email"
        static let noteTitle = "Комментарий"
        static let notePlaceholder = "Добавить комментарий"
    }
    
    struct Errors {
        static let noInternetConnection = "Отсутствует интернет-соединение"
    }
}
