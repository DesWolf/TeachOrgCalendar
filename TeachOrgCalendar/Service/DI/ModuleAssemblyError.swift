//
//  ModuleAssemblyError.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//
import Foundation

enum ModuleAssemblyError: Error {
    case viewControllerInstantiationError
    case dependencyResolvingError
}
