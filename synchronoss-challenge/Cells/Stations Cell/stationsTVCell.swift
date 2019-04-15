//
//  stationsTVCell.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit
import MapKit

class stationsTVCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var cardView: UIView!
    @IBOutlet var stationNameLbl: UILabel!
    
    @IBOutlet var mapView: MKMapView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCardViewShadows(shadowColor: UIColor.generateRandomColor())
    }
    
    // MARK: - Functions
    func setupCardViewShadows(shadowColor: UIColor){
        let view = cardView
        view?.backgroundColor = shadowColor
        view?.layer.cornerRadius = 10.0
        view?.layer.shadowColor = shadowColor.cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 2)
        view?.layer.shadowOpacity = 0.8
        view?.layer.shadowRadius = 3
        view?.layer.masksToBounds = false
        
        self.mapView.layer.cornerRadius = 10
    }
    
    func configureCell(station: Station) {
        self.stationNameLbl.text = station.stationDesc
        
        self.addStationAnnotaionWithCoordinates(CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: station.stationLatitude)!,
                                                                       longitude: CLLocationDegrees(exactly: station.stationLongitude)!))
    }
    
    func addStationAnnotaionWithCoordinates(_ hsCoordinates: CLLocationCoordinate2D){
        let stationAnnotation = MKPointAnnotation()
        stationAnnotation.coordinate = hsCoordinates
        self.mapView.addAnnotation(stationAnnotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: stationAnnotation.coordinate, span: span)
        let adjustRegion = self.mapView.regionThatFits(region)
        self.mapView.setRegion(adjustRegion, animated: true)
    }
    
}
