//
//  ViewController.swift
//  Ecobici
//
//  Created by Nestor A on 14/04/21.
//

import UIKit
import  GoogleMaps

class ViewController: UIViewController {

    var latitud:Double = 19.4326077
    var longitud:Double = -99.133208
    var appNetworkUtils = AppNetworkUtil()
    var mapView: GMSMapView?
    var response: [Stations] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(AppConstant.API_KEY_MAPS)
        
        let camera = GMSCameraPosition.camera(withLatitude: latitud, longitude: longitud, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView!)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.appNetworkUtils.requestEcobiciStations { (stat) in
                DispatchQueue.main.async {
                    self.response = stat.network.stations
                    for cor in self.response{
                        if(cor.empty_slots > 1){
                            self.printMarkers(latitud: cor.latitude, longitud: cor.longitude, title: cor.name, mapView: self.mapView!)
                        }
                        
                    }
                    
                }
            }
        }
    }
    

    func printMarkers(latitud:Double, longitud:Double, title:String,  mapView:GMSMapView) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        marker.title = title
        marker.map = mapView
    }
     
}

