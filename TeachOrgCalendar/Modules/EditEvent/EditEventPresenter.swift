//
//  EditEventPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import UIKit

protocol EditEventPresenterProtocol {
    var view: EditEventViewProtocol! { get set }
    var showPrice: Bool { get set }
    
    func viewDidLoad()
    func cellIdentifier(at index: Int) -> String
    func row(at index: Int) -> EditEventRow
    func atIndex(type: EditEventRow) -> IndexPath
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func saveEvent()
    func cancelEdit()
}

class EditEventPresenter {
    
    // MARK: - Public properties
    
    weak var view: EditEventViewProtocol!
    var showPrice = true
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    private let databaseManager: DatabaseManager
    private var event = Event()
    private var noteCellSize: CGSize = CGSize(width: 0, height: 90)
    let rowsLayout: [EditEventRow] = [
        .name,
        .place,
        .studentInfo,
        .time,
        .repeatedly,
        .reminderAndPrice,
        .note
    ]
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly,
         databaseManager: DatabaseManager,
         event: Event?) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        
        guard let event = event else {
            return
        }
        self.event = event
    }
    
    private func navigateToEvent(event: Event) {
//        if let newView = try? moduleAssembly.assembledView(for: .student(student: student)) {
//            newView.modalPresentationStyle = .fullScreen
//            self.view.push(viewController: newView, animated: true)
//        }
    }
    
    private func simpleAlert(message: String) {
        UIAlertController.simpleAlert(title:"Error", msg:"\(message)", target: view as! UIViewController)
    }
    
    private func find(value searchValue: EditEventRow, in array: [EditEventRow]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == searchValue {
                return index
            }
        }
        return nil
    }
}

extension EditEventPresenter: EditEventPresenterProtocol {
    func saveEvent() {
//        guard var event = event else {
//            return
//        }
        
        if event.name == nil || event.name == "" {
            simpleAlert(message: Strings.EditStudent.Error.emptyName)
            return
        }

        if event.id == nil {
            let newId = databaseManager.addEvent(event: event)
            event.id = newId
        } else {
            databaseManager.editEvent(event: event)
        }

//        navigateToStudentProfile(student: student)
    }
    
    func cancelEdit() {
        view.popViewController(animated: true)
    }
    
    func viewDidLoad() {
    }
    
    func numberOfRows() -> Int {
        rowsLayout.count
    }
    
    func atIndex(type: EditEventRow) -> IndexPath {
        let index = find(value: type, in: rowsLayout) ?? 0
        
        return IndexPath(row: index, section: 0)
    }
    
    func row(at index: Int) -> EditEventRow {
        return rowsLayout[index]
    }
    
    func cellIdentifier(at index: Int) -> String {
        rowsLayout[index].cellIdentifier
    }
    
    func model(at index: Int) -> SelfConfigurableViewModel {
        let rowType = rowsLayout[index]
        switch rowType {
        case .name:
            return TableCellWithTextFieldViewModel(cellTextField: event.name,
                                                   elem: .name,
                                                   delegate: self)
        case .place:
            return TableCellWithTextFieldViewModel(cellTextField: event.place,
                                                   elem: .place,
                                                   delegate: self)
        case .studentInfo:
            var student = ""
            
            if let studentId = event.studentId {
                let studentData = databaseManager.student(id: studentId)
                
                if let name = studentData.name {
                    student.append(name)
                }
                if let surname = studentData.surname {
                    student.append(" ")
                    student.append(surname)
                }
            }
            
            let firstElem = EditEventElem(title: Strings.EditEvent.student,
                                          text: student,
                                          type: .student)
            let secondElem = EditEventElem(title: Strings.EditEvent.discipline,
                                          text: event.discipline,
                                          type: .discipline)
            
            return TableCellWithStackViewModel(elements: [firstElem, secondElem],
                                        delegate: self)
            
        case .time:
            let firstElem = EditEventElem(title: Strings.EditEvent.startEvent,
                                          text: event.startDate?.eventDateShort(),
                                          type: .startEvent)
            let secondElem = EditEventElem(title: Strings.EditEvent.endEvent,
                                          text: event.endDate?.eventDateShort(),
                                          type: .endEvent)
            
            return TableCellWithStackViewModel(elements: [firstElem, secondElem],
                                               delegate: self)
        case .repeatedly:
            return TableCellWithTextFieldViewModel(cellTextField: event.repeatedly?.rawValue,
                                                   elem: .repeatedly,
                                                   delegate: self)
        case .reminderAndPrice:
            
            return EditEventReminderAndPriceViewModel(reminder: event.reminder,
                                                      price: event.price,
                                                      showPrice: showPrice,
                                                      delegate: self)
        case .note:
            return EventNoteViewModel(cellTextView: event.note,
                                      delegate: self)
        }
    }
}

extension EditEventPresenter: TableCellWithTextDelegate {
    func textFieldDidChanged(elem: EditEventElemType, text: String?) {
        guard let text = text else {
            return
        }
        
        switch elem {
        case .name:
            event.name = text
        case .place:
            event.place = text
        case .repeatedly:
                event.repeatedly = Repeatedly.byName(name: text)
        default:
            return
        }
    }
}

extension EditEventPresenter: ViewWithTitleAndTextDelegate {
    func tap(elem: EditEventElemType) {
        switch elem {
        case .student:
            print("studentTAP")
        case .discipline:
            print("disciplineTAP")
        case .startEvent:
            print("startTap")
        case .endEvent:
            print("endTap")
        case .reminder:
            print("retinderTAP")
        case .price:
            print("priceTAP")
        default:
            return
        }
    }
}

extension EditEventPresenter: EventNoteTableCellDelegate {
    func textViewDidChanged(text: String?, newSize: CGSize) {
        event.note = text
    
        if noteCellSize.height != newSize.height {
            view.reloadNoteCell()
        }
    }
}

extension EditEventPresenter: EditPriceDelegate {
    func textFieldDidChanged(price: Int?) {
        event.price = price
    }
    
    
}
