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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(AppConstant.API_KEY_MAPS)
        
        let camera = GMSCameraPosition.camera(withLatitude: latitud, longitude: longitud, zoom: 10.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView!)
        
        appNetworkUtils.requestEcobiciStations(url: AppConstant.API_BASE + AppConstant.END_POINT_ECOBICI)
        relizeMarkers()
    }

    func relizeMarkers() {
        print(appNetworkUtils.stations.count)
        appNetworkUtils.stations.forEach{ cord in
            printMarkers(latitud: cord.latitude, longitud: cord.longitude, title: cord.name, mapView: mapView!)
        }
    }

    func printMarkers(latitud:Double, longitud:Double, title:String,  mapView:GMSMapView) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        marker.title = title
        marker.map = mapView
    }
     
}

