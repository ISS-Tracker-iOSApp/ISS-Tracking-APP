//
//  ConfiguracaoView.swift
//  Nano7App
//
//  Created by Luiz Araujo on 17/11/21.
//

import UIKit

class ConfiguracaoView: UIView {
    
    lazy var iconView: UIImageView = {
        let ico = UIImageView()
        return ico
    }()
    
    
    lazy var textView: UILabel = {
        let txt = UILabel()
        txt.text = "Teste"
        return txt
    }()
    
    
    lazy var toggleView: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    
    lazy var tableView: UITableView = {
        let tbl = UITableView()
        return tbl
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
