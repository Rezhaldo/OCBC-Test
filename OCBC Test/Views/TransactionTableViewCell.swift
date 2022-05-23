//
//  TransactionTableViewCell.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 21/05/22.
//

import UIKit
import Alamofire


class TransactionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelReceipientName: UILabel!
    @IBOutlet weak var labelAccountNoReceipient: UILabel!
    @IBOutlet weak var labelAmountTransfer: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let userToken = UserDefaults.standard.string(forKey: "user_token") ?? ""
//
//        let transactionURL = URL(string: "https://green-thumb-64168.uc.r.appspot.com/transactions")
//
//        let header = HTTPHeaders(["Content-Type":"application/json","Accept":"application/json","Authorization":userToken])
//
//        AF.request(transactionURL!, method: .get, headers: header).response(completionHandler: { response in
//
//            print("response transaction: \(response)")
//
//        guard let data = response.data else { return }
//
//        do {
//            let decoder = JSONDecoder()
//            let transactionResponse = try decoder.decode(TransactionResponse.self, from: data)
//            print("response transaction parse: \(transactionResponse)")
//            self.labelNameContact.text = "\(transactionResponse.status)"
//        } catch let error {
//            print("Error Request: \(error.localizedDescription)")
//        }
//    })
        
    }
    
    func setData(data: TransactionData) {
        labelReceipientName.text = data.receipient?.accountHolder
        labelAmountTransfer.text = "\(data.amount ?? 0)"
        labelAccountNoReceipient.text = data.receipient?.accountNo
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
