//
//  TableViewCell.swift
//  trabalhoIOS
//
//  Created by Faculdade Alfa on 23/02/2019.
//  Copyright © 2019 Faculdade Alfa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var marcaLbl: UILabel!
    @IBOutlet weak var modelolbl: UILabel!
    @IBOutlet weak var anoLbl: UILabel!
    @IBOutlet weak var valorLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
