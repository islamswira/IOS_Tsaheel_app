//
//  Component.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import Foundation


struct HomePageModel {
    private(set) public var title:String
    private(set) public var imageName: String
    
    
    init(title:String, imageName:String){
        self.title = title
        self.imageName = imageName
    }
}
