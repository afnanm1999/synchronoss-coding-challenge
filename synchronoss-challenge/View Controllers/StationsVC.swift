//
//  StationsVC.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class StationsVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier: String = "stationCell"
    let viewModel: StationsViewModel = StationsViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewNib = UINib(nibName: "stationsTVCell", bundle: nil)
        self.tableView.register(tableViewNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.fetchData(success: { _ in
            self.tableView.reloadData()
        }) { (error) in
            if let error = error {
                print("Error Occured: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegates
extension StationsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stationsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: stationsTVCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! stationsTVCell
        cell.configureCell(station: viewModel.stationsItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "detailsVC") as? UINavigationController
        let vc = navigationController?.viewControllers.first as? StationsDetailsVC
        self.present(navigationController!, animated: true, completion: nil)
    }
}

