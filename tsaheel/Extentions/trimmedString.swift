//
//  trimmedString.swift
//  tsaheel
//
//  Created by Islam Swira on 8/26/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import Foundation

    extension String{
        var trimmed: String{
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
