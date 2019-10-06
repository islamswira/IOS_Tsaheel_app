//
//  EstrahaData.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import Foundation
struct EstrahaData : Codable {
    let id : String?
    let title : String?
    let state : String?
    let city : String?
    let address : String?
    let bath : String?
    let bed : String?
    let cooking : String?
    let living : String?
    let area : String?
    let description : String?
    let marafq : String?
    let full_in : String?
    let full_out : String?
    let n_mid_in : String?
    let n_mid_out : String?
    let m_mid_in : String?
    let m_mid_out : String?
    let price1 : String?
    let price2 : String?
    let price3 : String?
    let price4 : String?
    let price5 : String?
    let price6 : String?
    let price7 : String?
    let price8 : String?
    let price9 : String?
    let price10 : String?
    let cost : String?
    let cat : String?
    let lat : String?
    let lng : String?
    let img : String?
    let user_id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case state = "state"
        case city = "city"
        case address = "address"
        case bath = "bath"
        case bed = "bed"
        case cooking = "cooking"
        case living = "living"
        case area = "area"
        case description = "description"
        case marafq = "marafq"
        case full_in = "full_in"
        case full_out = "full_out"
        case n_mid_in = "n_mid_in"
        case n_mid_out = "n_mid_out"
        case m_mid_in = "m_mid_in"
        case m_mid_out = "m_mid_out"
        case price1 = "price1"
        case price2 = "price2"
        case price3 = "price3"
        case price4 = "price4"
        case price5 = "price5"
        case price6 = "price6"
        case price7 = "price7"
        case price8 = "price8"
        case price9 = "price9"
        case price10 = "price10"
        case cost = "cost"
        case cat = "cat"
        case lat = "lat"
        case lng = "lng"
        case img = "img"
        case user_id = "user_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        bath = try values.decodeIfPresent(String.self, forKey: .bath)
        bed = try values.decodeIfPresent(String.self, forKey: .bed)
        cooking = try values.decodeIfPresent(String.self, forKey: .cooking)
        living = try values.decodeIfPresent(String.self, forKey: .living)
        area = try values.decodeIfPresent(String.self, forKey: .area)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        marafq = try values.decodeIfPresent(String.self, forKey: .marafq)
        full_in = try values.decodeIfPresent(String.self, forKey: .full_in)
        full_out = try values.decodeIfPresent(String.self, forKey: .full_out)
        n_mid_in = try values.decodeIfPresent(String.self, forKey: .n_mid_in)
        n_mid_out = try values.decodeIfPresent(String.self, forKey: .n_mid_out)
        m_mid_in = try values.decodeIfPresent(String.self, forKey: .m_mid_in)
        m_mid_out = try values.decodeIfPresent(String.self, forKey: .m_mid_out)
        price1 = try values.decodeIfPresent(String.self, forKey: .price1)
        price2 = try values.decodeIfPresent(String.self, forKey: .price2)
        price3 = try values.decodeIfPresent(String.self, forKey: .price3)
        price4 = try values.decodeIfPresent(String.self, forKey: .price4)
        price5 = try values.decodeIfPresent(String.self, forKey: .price5)
        price6 = try values.decodeIfPresent(String.self, forKey: .price6)
        price7 = try values.decodeIfPresent(String.self, forKey: .price7)
        price8 = try values.decodeIfPresent(String.self, forKey: .price8)
        price9 = try values.decodeIfPresent(String.self, forKey: .price9)
        price10 = try values.decodeIfPresent(String.self, forKey: .price10)
        cost = try values.decodeIfPresent(String.self, forKey: .cost)
        cat = try values.decodeIfPresent(String.self, forKey: .cat)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
        img = try values.decodeIfPresent(String.self, forKey: .img)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
    }
    
}
