//
//  EstrahaDetailsModel.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import Foundation
struct EstrahaDetailsModel: Codable {
    let status : Int?
    let msg : String?
    let ar_msg : String?
    let data : [EstrahaData]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case msg = "msg"
        case ar_msg = "ar_msg"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        ar_msg = try values.decodeIfPresent(String.self, forKey: .ar_msg)
        data = try values.decodeIfPresent([EstrahaData].self, forKey: .data)
    }
}
