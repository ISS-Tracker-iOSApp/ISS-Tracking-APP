//
//  ConfiguracoesTableViewCell.swift
//  Nano7App
//
//  Created by Luiz Araujo on 17/11/21.
//

import UIKit

class ConfigurationCellIconTextToggle: UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private var contentSize: CGSize {
            return self.contentView.frame.size
    }
    
    let generalIcon   = ConfigurationViews().iconView
    let generalText   = ConfigurationViews().textView
    let generalToggle = ConfigurationViews().toggleView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.contentView.addSubview(self.generalIcon)
        self.contentView.addSubview(self.generalText)
        self.contentView.addSubview(self.generalToggle)
        
        self.generalIcon.addConstraintAndConstant(with: self.contentView, centerY: 0, leading: self.contentSize.width * 0.045918, width: self.contentSize.width * 0.153061)
        self.generalToggle.addConstraintAndConstant(with: self.contentView, centerY: 0, trailing: self.contentSize.width * -0.045918, width: self.contentSize.width * 0.153061)
        self.generalText.addConstraintAndConstant(with: self.contentView, top: 0, bottom: 0)
        self.generalText.leadingAnchor.constraint(equalTo: self.generalIcon.trailingAnchor, constant: self.contentSize.width * 0.045918).isActive = true
        self.generalText.trailingAnchor.constraint(equalTo: self.generalToggle.leadingAnchor).isActive = true
    }

}





class ConfiguracoesCellText: UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private var contentSize: CGSize {
            return self.contentView.frame.size
    }
    
    let iconReduceAnimation   = ConfigurationViews().iconView
    let textReduceAnimation   = ConfigurationViews().textView
    let toggleReduceAnimation = ConfigurationViews().toggleView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.contentView.addSubview(self.textReduceAnimation)
        
        self.textReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, leading: self.contentSize.width * 0.045918, trailing: self.contentSize.width * 0.045918)
    }
}





class ConfiguracoesCellIconText: UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private var contentSize: CGSize {
            return self.contentView.frame.size
    }
    
    let iconReduceAnimation   = ConfigurationViews().iconView
    let textReduceAnimation   = ConfigurationViews().textView
    let toggleReduceAnimation = ConfigurationViews().toggleView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.contentView.addSubview(self.iconReduceAnimation)
        self.contentView.addSubview(self.textReduceAnimation)
        
        self.iconReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, leading: self.contentSize.width * 0.045918, width: self.contentSize.width * 0.153061, height: self.contentSize.width * 0.076531)
        self.textReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, trailing: self.contentSize.width * -0.045918)
        self.textReduceAnimation.leadingAnchor.constraint(equalTo: self.iconReduceAnimation.trailingAnchor, constant: self.contentSize.width * 0.045918).isActive = true
    }

}
