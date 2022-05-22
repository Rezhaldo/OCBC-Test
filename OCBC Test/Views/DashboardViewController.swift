//
//  DashboardViewController.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 21/05/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableViewTransactionHistory: UITableView!
    @IBOutlet weak var labelAmountBalance: UILabel!
    @IBOutlet weak var labelNumberOfAccount: UILabel!
    @IBOutlet weak var labelAccountHolder: UILabel!
    @IBOutlet weak var buttonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewTransactionHistory.register(UINib(nibName: "TransactionTableViewCell", bundle: Bundle(for: TransactionTableViewCell.self)), forCellReuseIdentifier: "TransactionCell")
        tableViewTransactionHistory.delegate = self
        tableViewTransactionHistory.dataSource = self
        
    }
    
    @IBAction func buttonLogoutInTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "22 may"
    }
    
}
