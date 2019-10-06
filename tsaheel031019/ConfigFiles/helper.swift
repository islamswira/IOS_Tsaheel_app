//
//  helper.swift
//  tsaheel
//
//  Created by Islam Swira on 8/26/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class helper: NSObject {

    class func restartApp(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        guard let window = UIApplication.shared.keyWindow else {return}
        
        if getID() == nil {
            // there is no token found ,, go to login Screen
            vc = sb.instantiateInitialViewController()!
        }else{
            // there is token found ,, go to home Screen
            vc = sb.instantiateViewController(withIdentifier: "main")
        }
        
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func saveIDToUserDefault(id: String){
        let def = UserDefaults.standard
        def.setValue(id, forKey: Constants.USER_ID)
        def.synchronize()
        //restartup
        restartApp()
    }
    
    class func saveMemStatueToUserDefault(memStatue: String){
        let def = UserDefaults.standard
        def.setValue(memStatue, forKey: Constants.MEM_STATUE)
        def.synchronize()
    }
    
    class func getID()->String?{
        let def = UserDefaults.standard
        return def.object(forKey: Constants.USER_ID) as? String
    }
    
    class func getMEM_STATUE()->String?{
        let def = UserDefaults.standard
        return def.object(forKey: Constants.MEM_STATUE) as? String
    }
    
}
