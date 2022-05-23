//
//  DashboardViewController.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 21/05/22.
//

import UIKit
import Alamofire

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableViewTransactionHistory: UITableView!
    @IBOutlet weak var labelAmountBalance: UILabel!
    @IBOutlet weak var labelNumberOfAccount: UILabel!
    @IBOutlet weak var labelAccountHolder: UILabel!
    @IBOutlet weak var buttonLogout: UIButton!
    @IBOutlet weak var viewTopCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(named: "dasar")
        viewTopCard.backgroundColor = UIColor.white
        viewTopCard.layer.shadowOffset = CGSize (width:10, height:10)
        viewTopCard.layer.shadowRadius = 5
        viewTopCard.layer.shadowOpacity = 0.3
        
        tableViewTransactionHistory.register(UINib(nibName: "TransactionTableViewCell", bundle: Bundle(for: TransactionTableViewCell.self)), forCellReuseIdentifier: "TransactionCell")
        tableViewTransactionHistory.delegate = self
        tableViewTransactionHistory.dataSource = self
        
        let userToken = UserDefaults.standard.string(forKey: "user_token") ?? ""
        
        let accountHolder = UserDefaults.standard.string(forKey: "account_holder")
        
        let balanceURL = URL(string: "https://green-thumb-64168.uc.r.appspot.com/balance")
        let header = HTTPHeaders(["Content-Type":"application/json", "Accept":"application/json", "Authorization": userToken])
        
                           
        AF.request(balanceURL!, method: .get, headers: header).response(completionHandler: { response in
            
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let balanceResponse = try decoder.decode(BalanceResponse.self, from: data)
                    print(balanceResponse)
                self.labelAmountBalance.text = "\(balanceResponse.balance)"
                self.labelNumberOfAccount.text = "\(balanceResponse.accountNo)"
                self.labelAccountHolder.text = accountHolder
            } catch let error {
                print("Error Request: \(error.localizedDescription)")
            }
        })
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "22 may"
    }
    
}
