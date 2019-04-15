//
//  StationsDetailsVC.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class StationsDetailsVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var backBtn: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var stationCode: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
