//
//  ConfiguracoesTableViewCell.swift
//  Nano7App
//
//  Created by Luiz Araujo on 17/11/21.
//

import UIKit

class ConfiguracoesTableViewCell: UITableViewCell {

    let iconReduceAnimation = ConfiguracaoViews().iconView
    let textReduceAnimation = ConfiguracaoViews().textView
    let toggleReduceAnimation = ConfiguracaoViews().toggleView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
