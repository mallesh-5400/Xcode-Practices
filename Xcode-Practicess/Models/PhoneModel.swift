//
//  PhoneModel.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/28/22.
//

import Foundation

struct PhoneModel: Decodable {
    let error: String?
    let data: [PhoneDetails]?
}

struct PhoneDetails: Decodable {
    let name, operatingSystem, manufacturer, color: String?
}

//{
//  "errorMessage": "",
//  "data": [
//    {
//      "name": "Google Pixel 4",
//      "operatingSystem": "Android",
//      "manufacturer": "Google",
//      "color": "White"
//    }
//  ]
