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
        static let okButton = "Ок"
        static let agree = "Да"
        static let disagree = "Нет"
        static let currency = "₽"
        static let delete = "Удалить"
        
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
    
    struct Event {
        static let notPaid = "Не оплачено"
        static let paid = "Оплачено"
    }
    
    struct EditEvent {
        static let name = "Название:"
        static let namePlaceholder = "Введите название"
        static let place = "Место:"
        static let placePlaceholder = "Укажите место"
        static let student = "Ученик:"
        static let discipline = "Предмет занятий:"
        
        static let startEvent = "Начало:"
        static let endEvent = "Конец:"
        static let repeatLesson = "Повтор:"
        static let repeatPlaceholder = "Никогда"
        static let reminder = "Напоминание:"
        static let price = "Стоимость занятия:"
        static let pricePlaceHolder = "0 руб."
        static let note = "Комментарии:"
        
        struct Repeat {
            static let never = "Никогда"
        }
    }
    
    struct Alerts {
        static let paymentQuestion = "Занятие оплачено?"
    }
    
    struct Errors {
        static let noInternetConnection = "Отсутствует интернет-соединение"
    }
}
