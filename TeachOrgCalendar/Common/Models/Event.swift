//
//  Event.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import Foundation

struct Event {
    var id: String?
    var name: String
    var place: String?
    var studentId: String?
    var discipline: String?
    var startDate: TimeInterval
    var endDate: TimeInterval
    var dates: [TimeInterval]
    var repeatedly: Repeatedly?
    var endRepeat: TimeInterval?
    var reminder: Reminder?
    var price: Int?
    var note: String?
    var paymentStatus: Bool?
    var paymentDate: TimeInterval?
}
