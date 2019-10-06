//
//  dataServices.swift
//  tsaheel
//
//  Created by Islam Swira on 8/29/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import Foundation

class dataServices {
    
    
    
    static let instance = dataServices()
    
    
    private let component = [
        HomePageModel(title: "أفراحكم", imageName: "yourParty"),
        HomePageModel(title: "مؤنكم", imageName: "yourMeals"),
        HomePageModel(title: "مشترياتي", imageName: "yourShopping"),
        HomePageModel(title: "كروتي و بطاقاتي", imageName: "yourCards"),
        HomePageModel(title: "ترفيهي", imageName: "YourPlay"),
        HomePageModel(title: "إعدادات", imageName: "setting")
        
    ]
    
    func getHomePageComponent() -> [HomePageModel] {
        return component
    }
}
