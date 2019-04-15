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
        
        setupCardViewShadows(color: UIColor.generateRandomColor())
    }
    
    // MARK: - Functions
    
    /// This will set shadows to the `cardView`.
    ///
    /// - Parameter color: The UIColor that you want the shadow and the background to be.
    ///
    func setupCardViewShadows(color: UIColor){
        let view = cardView
        view?.backgroundColor = color
        view?.layer.cornerRadius = 10.0
        view?.layer.shadowColor = color.cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 2)
        view?.layer.shadowOpacity = 0.8
        view?.layer.shadowRadius = 3
        view?.layer.masksToBounds = false
        
        self.mapView.layer.cornerRadius = 10
    }
    
    /// This function is used to configure the cell UI Elements.
    ///
    /// - Parameter station: The Station Model which will be used to configure this cell.
    ///
    func configureCell(station: Station) {
        self.stationNameLbl.text = station.stationDesc
        
        self.addStationAnnotaionWithCoordinates(CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: station.stationLatitude)!,
                                                                       longitude: CLLocationDegrees(exactly: station.stationLongitude)!))
    }
    
    /// This will add an annotation to `MKMapView`.
    ///
    /// - Parameter stationCoordinates: The Coordinates for where you want to place the Annotation.
    ///
    func addStationAnnotaionWithCoordinates(_ stationCoordinates: CLLocationCoordinate2D){
        let stationAnnotation = MKPointAnnotation()
        stationAnnotation.coordinate = stationCoordinates
        self.mapView.addAnnotation(stationAnnotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: stationAnnotation.coordinate, span: span)
        let adjustRegion = self.mapView.regionThatFits(region)
        self.mapView.setRegion(adjustRegion, animated: true)
    }
    
}
