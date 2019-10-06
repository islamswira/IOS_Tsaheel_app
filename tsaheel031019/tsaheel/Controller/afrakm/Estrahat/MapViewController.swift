//
//  MapViewController.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import GoogleMaps
import BRYXBanner
class MapViewController: UIViewController {
    var lat = String()
    var long = String()

    var estrahaTitle = String()
    var city = String()
    var estrahatARRDetails : EstrahaData?{
        didSet{
            print("Hey I am In Map VC Go!!")
            
            DispatchQueue.main.async {
                self.lat = (self.estrahatARRDetails?.lat ?? "")
                self.long = (self.estrahatARRDetails?.lng ?? "")
                self.estrahaTitle = (self.estrahatARRDetails?.title ?? "")
                self.city = (self.estrahatARRDetails?.city ?? "")
                print("lat didload\(self.lat)")
                
                if self.lat != "" && self.long != ""{
                    
                    let camera = GMSCameraPosition.camera(withLatitude:Double(self.lat) as! CLLocationDegrees, longitude:Double(self.long) as! CLLocationDegrees, zoom: 6.0)
                    let frame = self.view.frame
                    let mapView = GMSMapView.map(withFrame: frame, camera: camera)
                    //                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                    self.view = mapView
                    
                    // Creates a marker in the center of the map.
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude:Double(self.lat) as! CLLocationDegrees, longitude: Double(self.long) as! CLLocationDegrees)
                    marker.title = self.estrahaTitle
                    marker.snippet = self.city
                    marker.map = mapView
                    print("mapview restarted")
                }else{
                    let banner = Banner(title: "تنبيه", subtitle: "معلومات المكان على الخريطة غير متوفرة", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 3.0)
                }
                
                
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
  
    }
    
//


}
