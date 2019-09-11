/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let id : String?
	let name : String?
	let phone : String?
	let national_id : String?
	let email : String?
	let user_hash : String?
	let address : String?
	let comp_name : String?
	let comp_type : String?
	let comp_tele : String?
	let comp_phone : String?
	let comp_city : String?
	let comp_state : String?
	let comp_street : String?
	let car_type : String?
	let car_model : String?
	let car_num : String?
	let photo1 : String?
	let photo2 : String?
	let mem_status : String?
	let created_date : String?
	let num_confirm : String?
	let is_active : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case phone = "phone"
		case national_id = "national_id"
		case email = "email"
		case user_hash = "user_hash"
		case address = "address"
		case comp_name = "comp_name"
		case comp_type = "comp_type"
		case comp_tele = "comp_tele"
		case comp_phone = "comp_phone"
		case comp_city = "comp_city"
		case comp_state = "comp_state"
		case comp_street = "comp_street"
		case car_type = "car_type"
		case car_model = "car_model"
		case car_num = "car_num"
		case photo1 = "photo1"
		case photo2 = "photo2"
		case mem_status = "mem_status"
		case created_date = "created_date"
		case num_confirm = "num_confirm"
		case is_active = "is_active"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		national_id = try values.decodeIfPresent(String.self, forKey: .national_id)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		user_hash = try values.decodeIfPresent(String.self, forKey: .user_hash)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		comp_name = try values.decodeIfPresent(String.self, forKey: .comp_name)
		comp_type = try values.decodeIfPresent(String.self, forKey: .comp_type)
		comp_tele = try values.decodeIfPresent(String.self, forKey: .comp_tele)
		comp_phone = try values.decodeIfPresent(String.self, forKey: .comp_phone)
		comp_city = try values.decodeIfPresent(String.self, forKey: .comp_city)
		comp_state = try values.decodeIfPresent(String.self, forKey: .comp_state)
		comp_street = try values.decodeIfPresent(String.self, forKey: .comp_street)
		car_type = try values.decodeIfPresent(String.self, forKey: .car_type)
		car_model = try values.decodeIfPresent(String.self, forKey: .car_model)
		car_num = try values.decodeIfPresent(String.self, forKey: .car_num)
		photo1 = try values.decodeIfPresent(String.self, forKey: .photo1)
		photo2 = try values.decodeIfPresent(String.self, forKey: .photo2)
		mem_status = try values.decodeIfPresent(String.self, forKey: .mem_status)
		created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
		num_confirm = try values.decodeIfPresent(String.self, forKey: .num_confirm)
		is_active = try values.decodeIfPresent(String.self, forKey: .is_active)
	}

}