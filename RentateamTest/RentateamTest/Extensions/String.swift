//
//  String.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

extension String {
    var formattedDate: String {
        guard let date = DateFormatter.dateFormatFromXML.date(from: self) else { return "" }
        return DateFormatter.dateFormatForView.string(from: date)
    }
}
