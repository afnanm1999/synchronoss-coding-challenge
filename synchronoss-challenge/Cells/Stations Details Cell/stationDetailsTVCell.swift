//
//  stationDetailsTVCell.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit
import MapKit

class stationDetailsTVCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var trainTypeLbl: UILabel!
    @IBOutlet var originLbl: UILabel!
    @IBOutlet var destinationLbl: UILabel!
    @IBOutlet var scheduledDepartureLbl: UILabel!
    @IBOutlet var scheduledArrivalLbl: UILabel!
    @IBOutlet var expectedDepartureLbl: UILabel!
    @IBOutlet var directionLbl: UILabel!
    @IBOutlet var statusLbl: UILabel!
    
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
    /// - Parameter station: The Station Model which will be used to configure this cells `MKMapView`.
    /// - Parameter stationDetails: The StationDetails Model which will be used to configure the UI Elements of this cell.
    func configureCell(station: Station, stationDetail: StationDetail) {
        self.trainTypeLbl.text = stationDetail.trainType!
        self.originLbl.text = stationDetail.origin!
        self.destinationLbl.text = stationDetail.destination!
        self.scheduledDepartureLbl.text = stationDetail.scheduledDepartTime!
        self.scheduledArrivalLbl.text = stationDetail.scheduledArrivalTime!
        self.expectedDepartureLbl.text = stationDetail.expectedDepartureTime!
        self.directionLbl.text = stationDetail.direction!
        self.statusLbl.text = stationDetail.status!
        
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
