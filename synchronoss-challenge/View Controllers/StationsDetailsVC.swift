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
    
    let cellIdentifier = "detailCell"
    let viewModel: StationsDetailViewModel  = StationsDetailViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.station?.stationDesc
        
        let stationsDetailCellNib = UINib(nibName: "stationDetailsTVCell", bundle: nil)
        self.tableView.register(stationsDetailCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.fetchData(success: { response in
            self.tableView.reloadData()
        }) { (error) in
            if let error = error {
                self.showAlert(title: "Uh, Oh", message: error.localizedDescription)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension StationsDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stationsDetailItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: stationDetailsTVCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! stationDetailsTVCell
        cell.configureCell(station: viewModel.station!, stationDetail: viewModel.stationsDetailItems[indexPath.row])
        return cell
    }
}
