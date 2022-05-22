//
//  TransactionTableViewCell.swift
//  OCBC Test
//
//  Created by Kevin Chilmi Rezhaldo on 21/05/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelNameContact: UILabel!
    @IBOutlet weak var labelIdNumberName: UILabel!
    @IBOutlet weak var labelNumberOfTransaction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
