//
//  Event.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import Foundation

struct Event {
    var id: String?
    var name: String?
    var place: String?
    var studentId: Int?
    var studentName: String?
    var studentSurname: String?
    var discipline: String?
    var startDate: String?
    var duration: [String]?
    var endDate: String?
    var repeatedly: String?
    var endRepeat: String?
    var reminder: Reminder?
    var price: Int?
    var note: String?
    var payStatus: Int?
    var paymentDate: String?
}
