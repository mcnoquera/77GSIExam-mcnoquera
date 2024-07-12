//
//  Apod.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/12/24.
//

import Foundation

struct Apod: Codable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright,
             date,
             explanation,
             hdurl,
             mediaType = "media_type",
             serviceVersion = "service_version",
             title,
             url
    }
}
