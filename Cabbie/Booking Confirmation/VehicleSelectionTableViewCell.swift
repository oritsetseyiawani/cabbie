//
//  VehicleSelectionTableViewCell.swift
//  Cabbie
//
//  Created by Awani Melvyn on 03/08/2022.
//

import UIKit

class VehicleSelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var numberOfSeatsLbl: UILabel!
    @IBOutlet weak var priceOfTripLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


