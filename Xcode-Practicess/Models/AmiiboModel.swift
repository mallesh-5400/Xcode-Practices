//
//  AmiiboModel.swift
//  FillTableViewWithAPIData
//
//  Created by user226203 on 9/23/22.
//

import Foundation

struct AmiiboList: Decodable{
    let amiibo: [AmiiboModel]
}


struct AmiiboModel: Decodable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    let release: ReleaseModel
    let tail: String
    let type: String
}
struct ReleaseModel: Decodable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}

/*
 
 "amiibo": [
   {
     "amiiboSeries": "Super Smash Bros.",
     "character": "Mario",
     "gameSeries": "Super Mario",
     "head": "00000000",
     "image": "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png",
     "name": "Mario",
     "release": {
       "au": "2014-11-29",
       "eu": "2014-11-28",
       "jp": "2014-12-06",
       "na": "2014-11-21"
     },
     "tail": "00000002",
     "type": "Figure"
   },
 */
