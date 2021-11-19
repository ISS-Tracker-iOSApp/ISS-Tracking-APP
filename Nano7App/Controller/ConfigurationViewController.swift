//
//  ConfiguracaoViewController.swift
//  Nano7App
//
//  Created by Luiz Araujo on 17/11/21.
//

import UIKit

//TODO: Modularizar

struct TableSection {
    var title: String
    var rows: [Row]
    var cell: Any
}

struct Row {
    var icon: UIImage?
    var text: String
    var toggle: UISwitch?
    var selector: Selector?
}

protocol Toggleble {
    var toggle: UISwitch? { get set }
}

extension Toggleble {
    mutating func setTarget(buttonTarget: Any?, buttonAction: Selector, buttonEvent: UIControl.Event) {
        self.toggle?.addTarget(buttonTarget, action: buttonAction, for: buttonEvent)
    }
}

protocol ConfigurationDelegate {
    func toggleHapticsClicked()
}


class ConfigurationViewController: UIViewController {
    let tableConfiguration = ConfigurationViews().tableView
    
    
    // 1) To create new Configuration Row, insert new element in the array below;
    // 2) If it will have something delegated:
    //      a) go to protocol/extension Toggleble and add the property or the method
    //      b) create an action
    //      c) addTarget in the cellforRowAt
    //      d) implement the method to perform the delegation
    var arraySection: [TableSection] = [
        TableSection(title: "GERAL", rows: [
//            Row(icon: UIImage(systemName: "iphone.badge.play"), text: "Reduce Animations", toggle: nil),
            Row(icon: UIImage(systemName: "iphone.radiowaves.left.and.right"), text: "Haptics", toggle: nil, selector: #selector(toggleHapticsClicked(_:)))
        ], cell: ConfigurationCellIconTextToggle.self)//,
//        TableSection(title: "MAPA", rows: [
//            Row(icon: UIImage(systemName: "location"), text: "Large Map Annotations", toggle: nil)
//        ], cell: ConfigurationCellIconTextToggle.self),
//        TableSection(title: "RECURSOS", rows: [
//            Row(icon: nil, text: "TrackISS Github repo", toggle: nil),
//            Row(icon: nil, text: "Open-Notify ApI", toggle: nil),
//            Row(icon: nil, text: "Where the ISS at? API", toggle: nil),
//            Row(icon: nil, text: "NASA Image and Video Library API", toggle: nil)
//        ], cell: ConfiguracoesCellText.self),
//        TableSection(title: "", rows: [
//            Row(icon: UIImage(systemName: "person"), text: "Developers", toggle: nil),
//            Row(icon: UIImage(systemName: "dollarsign.circle"), text: "Leave a tip", toggle: nil)
//        ], cell: ConfiguracoesCellIconText.self)
    ]
    
    //MARK: Delegate
    var delegate: ConfigurationDelegate?
    var userDefaultManager: UserDefaultsManager = UserDefaultsManager()
    
    //MARK: Lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = userDefaultManager
        
        self.tableConfiguration.dataSource = self
        self.tableConfiguration.delegate   = self
    
        self.view.addSubview(self.tableConfiguration)
        self.tableConfiguration.addConstraintAndConstant(with: self.view, centerX: 0, bottom: 0, leading: 0, trailing: 0)
        self.tableConfiguration.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: Actions
    @objc func toggleHapticsClicked(_ sender: UIButton) {
        print("Patrão: Oba, vou delegar! Severino...")
        self.delegate?.toggleHapticsClicked()
    }
}

extension ConfigurationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySection[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySection[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            self.tableConfiguration.register(ConfigurationCellIconTextToggle.self, forCellReuseIdentifier: ConfigurationCellIconTextToggle.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCellIconTextToggle.identifier) as! ConfigurationCellIconTextToggle
            cell.generalIcon.image = arraySection[indexPath.section].rows[indexPath.row].icon
            cell.generalText.text = arraySection[indexPath.section].rows[indexPath.row].text
            
            if arraySection[indexPath.section].rows[indexPath.row].selector != nil {
                cell.generalToggle.addTarget(self, action: arraySection[indexPath.section].rows[indexPath.row].selector!, for: .touchUpInside)
            }
            
            return cell
            
        case 1:
            self.tableConfiguration.register(ConfigurationCellIconTextToggle.self, forCellReuseIdentifier: ConfigurationCellIconTextToggle.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfigurationCellIconTextToggle.identifier) as! ConfigurationCellIconTextToggle
            cell.generalIcon.image = arraySection[indexPath.section].rows[indexPath.row].icon
            cell.generalText.text = arraySection[indexPath.section].rows[indexPath.row].text
            return cell
            
        case 2:
            self.tableConfiguration.register(ConfiguracoesCellText.self, forCellReuseIdentifier: ConfiguracoesCellText.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellText.identifier) as! ConfiguracoesCellText
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text
            
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case 3:
            self.tableConfiguration.register(ConfiguracoesCellIconText.self, forCellReuseIdentifier: ConfiguracoesCellIconText.identifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconText.identifier) as! ConfiguracoesCellIconText
            cell.iconReduceAnimation.image = arraySection[indexPath.section].rows[indexPath.row].icon
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text
            cell.accessoryType = .disclosureIndicator
            return cell
            
        default:
            print("Deu ruim.")
        }
        
        self.tableConfiguration.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }
    
    
}

extension ConfigurationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            print("if indexPath.section == 0 && indexPath.row == 0 {")
            self.delegate?.toggleHapticsClicked()
        }
    }
}


