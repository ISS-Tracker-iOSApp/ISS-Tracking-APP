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
        
//        self.contentSize =

        // Configure the view for the selected state
        self.contentView.addSubview(self.generalIcon)
        self.contentView.addSubview(self.generalText)
        self.contentView.addSubview(self.generalToggle)
        
        print("self.contentSize.width: \(self.contentSize.width)")
        
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
        
//        self.contentSize =

        // Configure the view for the selected state
        self.contentView.addSubview(self.textReduceAnimation)
        
        print("self.contentSize.width: \(self.contentSize.width)")
        
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
        
//        self.contentSize =

        // Configure the view for the selected state
        self.contentView.addSubview(self.iconReduceAnimation)
        self.contentView.addSubview(self.textReduceAnimation)
        
        print("self.contentSize.width: \(self.contentSize.width)")
        
        self.iconReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, leading: self.contentSize.width * 0.045918, width: self.contentSize.width * 0.153061, height: self.contentSize.width * 0.076531)
        self.textReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, trailing: self.contentSize.width * -0.045918)
        self.textReduceAnimation.leadingAnchor.constraint(equalTo: self.iconReduceAnimation.trailingAnchor, constant: self.contentSize.width * 0.045918).isActive = true
//        self.textReduceAnimation.trailingAnchor.constraint(equalTo: self.toggleReduceAnimation.leadingAnchor).isActive = true
//        self.toggleReduceAnimation.addConstraintAndConstant(with: self.contentView, centerY: 0, width: self.contentSize.width * 0.153061, height: self.contentSize.width * 0.076531)
    }

}



//struct Contact {
//    let name:String?
//    let jobTitle:String?
//    let country:String?
//}
//class ContactAPI {
//    static func getContacts() -> [Contact]{
//        let contacts = [
//            Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo"),
//            Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be"),
//            Contact(name: "John Young", jobTitle: "Interactive Designer", country: "af"),
//            Contact(name: "Tamilarasi Mohan", jobTitle: "Architect", country: "al"),
//            Contact(name: "Kim Yu", jobTitle: "Economist", country: "br"),
//            Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar"),
//            Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az"),
//            Contact(name: "Emily Adams", jobTitle: "Editor", country: "bo"),
//            Contact(name: "Aabidah Amal", jobTitle: "Creative Director", country: "au"),
//        ]
//        return contacts
//    }
//}
//
//
//class ContactTableViewCell: UITableViewCell {
//
//    var contact:Contact? {
//        didSet {
//            guard let contactItem = contact else {return}
//            if let name = contactItem.name {
//                profileImageView.image = UIImage(named: name)
//                nameLabel.text = name
//            }
//            if let jobTitle = contactItem.jobTitle {
//                jobTitleDetailedLabel.text = " \(jobTitle) "
//            }
//
//            if let country = contactItem.country {
//                countryImageView.image = UIImage(named: country)
//            }
//        }
//    }
//
//    let containerView:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
//        return view
//    }()
//
//    let profileImageView:UIImageView = {
//        let img = UIImageView()
//        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
//        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
//        img.layer.cornerRadius = 35
//        img.clipsToBounds = true
//        return img
//    }()
//
//    let nameLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.textColor = .black
//                label.translatesAutoresizingMaskIntoConstraints = false
//                return label
//            }()
//
//            let jobTitleDetailedLabel:UILabel = {
//                let label = UILabel()
//                label.font = UIFont.boldSystemFont(ofSize: 14)
//                label.textColor =  .white
//                label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
//                label.layer.cornerRadius = 5
//                label.clipsToBounds = true
//                label.translatesAutoresizingMaskIntoConstraints = false
//                return label
//            }()
//
//            let countryImageView:UIImageView = {
//                let img = UIImageView()
//                img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
//                img.translatesAutoresizingMaskIntoConstraints = false
//                img.layer.cornerRadius = 13
//                img.clipsToBounds = true
//                return img
//            }()
//
//            override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//                super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//                self.contentView.addSubview(profileImageView)
//                containerView.addSubview(nameLabel)
//                containerView.addSubview(jobTitleDetailedLabel)
//                self.contentView.addSubview(containerView)
//                self.contentView.addSubview(countryImageView)
//
//                profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//                profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
//                profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
//                profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
//
//                containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//                containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
//                containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
//                containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
//
//                nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
//                nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//                nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
//
//                jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
//                jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//                jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
//                jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//
//                countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
//                countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
//                countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
//                countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//            }
//
//            required init?(coder aDecoder: NSCoder) {
//
//                super.init(coder: aDecoder)
//            }
//
//        }
