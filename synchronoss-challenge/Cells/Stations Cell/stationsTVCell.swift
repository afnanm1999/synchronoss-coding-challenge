//
//  stationsTVCell.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class stationsTVCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var cardView: UIView!
    @IBOutlet var stationNameLbl: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCardViewShadows(shadowColor: UIColor.generateRandomColor())
    }
    
    func setupCardViewShadows(shadowColor: UIColor){
        let view = cardView
        view?.backgroundColor = shadowColor
        view?.layer.cornerRadius = 10.0
        view?.layer.shadowColor = shadowColor.cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 2)
        view?.layer.shadowOpacity = 0.8
        view?.layer.shadowRadius = 3
        view?.layer.masksToBounds = false
    }
    
    func configureCell(station: Station) {
        self.stationNameLbl.text = station.stationDesc
    }
    
    
}
