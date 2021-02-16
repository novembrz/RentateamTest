//
//  DateFormatter.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

extension DateFormatter {
    
    static let dateFormatFromXML: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        return formatter
    }()

    static let dateFormatForView: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
}
