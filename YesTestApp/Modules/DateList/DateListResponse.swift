//
//  DateListResponse.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation

struct DateListResponse: Codable {
    let results: [DateDetails]
}

struct DateDetails: Codable {
    let eventDescription: String
}
