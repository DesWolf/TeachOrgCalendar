//
//  CalendarViewController+CVCalendarDelegate.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/23/21.
//

import UIKit
import CVCalendar

// MARK: - CVCalendarViewAppearanceDelegate

extension CalendarViewController: CVCalendarViewAppearanceDelegate {

    func dayLabelWeekdayDisabledColor() -> UIColor { return .white }
    func dayLabelPresentWeekdayInitallyBold() -> Bool { return true }

    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont { return UIFont.systemFont(ofSize: 16) }

    //цвет цифр
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_,.in,.present): return .red
        case (_, .selected, _): return .white
        case (_, .out, _): return .calendarGray
        case (.sunday, _, _), (.saturday, _, _): return .tabItem
        case (_, _, .not): return .black

        default: return  .purple
        }
    }

    //Линии между цифрами
    func dotMarkerColor() -> UIColor { .calendarBlue }
}


//MARK: CVCalendar MenuViewDelegate

extension CalendarViewController: CVCalendarMenuViewDelegate {
    func dayOfWeekTextColor() -> UIColor {
        .black
    }
}


//MARK: CVCalendar CVCalendarViewDelegate

extension CalendarViewController: CVCalendarViewDelegate {
    func firstWeekday() -> Weekday {
        .monday
    }

    func presentationMode() -> CalendarMode {
        CalendarMode.monthView
    }
    func shouldShowWeekdaysOut() -> Bool { return true }

    func shouldAutoSelectDayOnWeekChange() -> Bool { return true }
    func shouldAutoSelectDayOnMonthChange() -> Bool { return true }

    func presentedDateUpdated(_ date: CVDate) {
        self.navigationItem.title = date.globalDescription
    }

    //Текущие кружки
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, .present): return .red
        case (_, .selected, .not): return .calendarBlue
        default: return  UIColor.clear
        }
    }

    //Отрисовка точек под кружками
    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor]{
        return [.calendarBlue]
    }

    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 15
    }
    func dotMarker(shouldShowOnDayView dayView: DayView) -> Bool{
        return preliminaryView(shouldDisplayOnDayView: dayView) ? true : false
    }


    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        guard let selectedDay = dayView.date.convertedDate() else {
                  return false
              }

        let timeInterval = selectedDay.timeIntervalSince1970

        return presenter.hasEvents(date: timeInterval)
    }

    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool){
        guard let selectedDay = dayView.date.convertedDate() else {
                  return
              }

        let timeInterval = selectedDay.timeIntervalSince1970
        let titleDate = TimeInterval().dateToTitleStr(timeInterval: timeInterval + Date().timeIntervalTimeZone)

        presenter.filterList(date: timeInterval)
        dateLabel.text = titleDate.capitalizingFirstLetter()
    }
}
