//
//  MapCell.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import UIKit
import GoogleMaps

class MapCell: UITableViewCell {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.isUserInteractionEnabled = false
    }
    
    func configureMap(coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate
        marker.map = self.mapView
        
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 6.0)
        mapView.camera = camera
    }
    
}
