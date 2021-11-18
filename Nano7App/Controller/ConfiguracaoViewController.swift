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
}

protocol Toggleble {
    var toggle: UISwitch? { get set }
//    mutating func setTarget(buttonTarget: Any?, buttonAction: Selector, buttonEvent: UIControl.Event)
}

extension Toggleble {
    mutating func setTarget(buttonTarget: Any?, buttonAction: Selector, buttonEvent: UIControl.Event) {
        self.toggle?.addTarget(buttonTarget, action: buttonAction, for: buttonEvent)
    }
}



class ConfiguracaoViewController: UIViewController {
    let tableConfiguracao = ConfiguracaoViews().tableView

    var arraySection: [TableSection] = [
        TableSection(title: "GERAL", rows: [
                                            Row(icon: UIImage(systemName: "iphone.badge.play"), text: "Reduce Animations", toggle: nil),
                                            Row(icon: UIImage(systemName: "iphone.radiowaves.left.and.right"), text: "Haptics", toggle: nil)
                                            ], cell: ConfiguracoesCellIconTextToggle.self),
        TableSection(title: "MAPA", rows: [
                                            Row(icon: UIImage(systemName: "location"), text: "Large Map Annotations", toggle: nil)
                                            ], cell: ConfiguracoesCellIconTextToggle.self),
        TableSection(title: "RECURSOS", rows: [
                                            Row(icon: nil, text: "TrackISS Github repo", toggle: nil),
                                            Row(icon: nil, text: "Open-Notify ApI", toggle: nil),
                                            Row(icon: nil, text: "Where the ISS at? API", toggle: nil),
                                            Row(icon: nil, text: "NASA Image and Video Library API", toggle: nil)
                                            ], cell: ConfiguracoesCellText.self),
        TableSection(title: "", rows: [
                                            Row(icon: UIImage(systemName: "person"), text: "Developers", toggle: nil),
                                            Row(icon: UIImage(systemName: "dollarsign.circle"), text: "Leave a tip", toggle: nil)
                                            ], cell: ConfiguracoesCellIconText.self)
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.addSubview(self.tableConfiguracao)
        self.tableConfiguracao.addConstraintAndConstant(with: self.view, centerX: 0, bottom: 0, leading: 0, trailing: 0)
        self.tableConfiguracao.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Teste
//        self.view.backgroundColor = .gray
        
        self.tableConfiguracao.dataSource = self
        self.tableConfiguracao.delegate   = self
        
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

extension ConfiguracaoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySection[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:  return 2
            case 1:  return 1
            case 2:  return 4
            case 3:  return 2
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
            case 0:
            self.tableConfiguracao.register(ConfiguracoesCellIconTextToggle.self, forCellReuseIdentifier: ConfiguracoesCellIconTextToggle.identifier)
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconTextToggle.identifier) as! ConfiguracoesCellIconTextToggle
            cell.iconReduceAnimation.image = arraySection[indexPath.section].rows[indexPath.row].icon //UIImage(systemName: "heart")
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text
//                  cell.toggleReduceAnimation.addTarget(<#T##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
                return cell
            case 1:
            self.tableConfiguracao.register(ConfiguracoesCellIconTextToggle.self, forCellReuseIdentifier: ConfiguracoesCellIconTextToggle.identifier)
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconTextToggle.identifier) as! ConfiguracoesCellIconTextToggle
            cell.iconReduceAnimation.image = arraySection[indexPath.section].rows[indexPath.row].icon //UIImage(systemName: "heart")
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text
            
            
                return cell
            case 2:
            self.tableConfiguracao.register(ConfiguracoesCellText.self, forCellReuseIdentifier: ConfiguracoesCellText.identifier)
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellText.identifier) as! ConfiguracoesCellText
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text

            cell.accessoryType = .disclosureIndicator

            
                return cell
            case 3:
            self.tableConfiguracao.register(ConfiguracoesCellIconText.self, forCellReuseIdentifier: ConfiguracoesCellIconText.identifier)
                let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconText.identifier) as! ConfiguracoesCellIconText
            cell.iconReduceAnimation.image = arraySection[indexPath.section].rows[indexPath.row].icon //UIImage(systemName: "heart")
            cell.textReduceAnimation.text = arraySection[indexPath.section].rows[indexPath.row].text
            cell.accessoryType = .disclosureIndicator
            
                return cell
            default:
                print("Deu ruim.")
        }
        
        self.tableConfiguracao.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }
    
    
}

extension ConfiguracaoViewController: UITableViewDelegate {
    
}




/*
 //
 //  ConfiguracaoViewController.swift
 //  Nano7App
 //
 //  Created by Luiz Araujo on 17/11/21.
 //

 import UIKit

 struct TableSection {
     var title: String
     var icon: UIImage
     var text: String
     var toggle: UISwitch
     var numberOfRows: Int
 }
 //
 class ConfiguracaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 //      let tableView = UITableView()
 //      var safeArea: UILayoutGuide!
 //    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
 //
 //      override func loadView() {
 //        super.loadView()
 //        view.backgroundColor = .white
 //        safeArea = view.layoutMarginsGuide
 //        setupTableView()
 ////
 //      }
 //      func setupTableView() {
 ////        view.addSubview(tableView)
 //      tableView.translatesAutoresizingMaskIntoConstraints = false
 //      tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
 //      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 //      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 //      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
 //
 //          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
 //
 //
 //
 //
 //    }
     let arraySectionTitle = ["GENERAL", "MAP", "RESOURCES", ""]
     let tableConfiguracao = ConfiguracaoViews().tableView

     let tableView = UITableView()
     var safeArea: UILayoutGuide!


     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)

 //        self.view.addSubview(self.tableConfiguracao)
 //        self.tableConfiguracao.addConstraintAndConstant(with: self.view, centerX: 0, bottom: 0, leading: 0, trailing: 0)
 //        self.tableConfiguracao.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
 //        self.tableConfiguracao.backgroundColor = .red
 //        // Teste
 //        self.view.backgroundColor = .gray
 ////        self.tableConfiguracao.register(ConfiguracoesCellIconTextToggle.self, forCellReuseIdentifier: ConfiguracoesCellIconTextToggle.identifier)
 //        self.tableConfiguracao.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
         view.backgroundColor = .white
            safeArea = view.layoutMarginsGuide
            setupTableView()
     }

     func setupTableView() {
         view.addSubview(tableView)
         tableView.backgroundColor = .red
       tableView.translatesAutoresizingMaskIntoConstraints = false
       tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
       tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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
 /*
 extension ConfiguracaoViewController: UITableViewDataSource {
     func numberOfSections(in tableView: UITableView) -> Int {
 //        return arraySectionTitle.count
         return 1
     }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return arraySectionTitle[section]
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //
 //        switch section {
 //            case 0:  return 2
 //            case 1:  return 1
 //            case 2:  return 4
 //            case 3:  return 2
 //            default: return 0
 //        }
         return 10
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         /*
         switch indexPath.section {
             case 0:
                 let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconTextToggle.identifier) as! ConfiguracoesCellIconTextToggle
                 cell.iconReduceAnimation.image = UIImage(systemName: "heart")
                 cell.textReduceAnimation.text = "Blablabla"
 //                  cell.toggleReduceAnimation.addTarget(<#T##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
                 return cell
             case 1:
                 let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconTextToggle.identifier) as! ConfiguracoesCellIconTextToggle
             
             
             
                 return cell
             case 2:
                 let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellText.identifier) as! ConfiguracoesCellText
             
             
             
                 return cell
             case 3:
                 let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconText.identifier) as! ConfiguracoesCellIconText
             
             
             
                 return cell
             default:
                 print("deu ruim")
         }
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
         return cell
          
           */
         
         
         
         
 //        let cell = tableView.dequeueReusableCell(withIdentifier: ConfiguracoesCellIconTextToggle.identifier) as! ConfiguracoesCellIconTextToggle
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
 //            cell.iconReduceAnimation.image = UIImage(systemName: "heart")
 //            cell.textReduceAnimation.text = "Blablabla"
         let textt = UILabel()
         textt.text = "basdasdsa"
         cell.addSubview(textt)
         textt.addConstraintAndConstant(with: cell, centerX: 0, centerY: 0)
 //                  cell.toggleReduceAnimation.addTarget(<#T##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
             return cell
     }
     
     
 }

 extension ConfiguracaoViewController: UITableViewDelegate {
     
 }


 */



 //
 //extension ConfiguracaoViewController {
 //  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //    return characters.count
 //  }
 //  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
 //    cell.textLabel?.text = characters[indexPath.row]
 //    return cell
 //  }
 //}

 //    private let contacts = ContactAPI.getContacts() // model
 //
 //let contactsTableView = UITableView() // view
    
    



 //   override func viewDidLoad() {
 //       super.viewDidLoad()
 //
 //       // Do any additional setup after loading the view.
 //       view.backgroundColor = .white
 //
 //       view.addSubview(contactsTableView)
 //
 //
 //       contactsTableView.addConstraintAndConstant(with: view, top: 0, bottom: 0, leading: 0, trailing: 0)
 //
 //       contactsTableView.dataSource = self
 //       contactsTableView.delegate = self
 //
 //
 ////      contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
 //       contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
 //
 //
 //
 //
 //       navigationItem.title = "Configuração"
 //   }
 //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //        return contacts.count
 //    }
 //
 //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 ////      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
 //        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
 //
 ////      cell.textLabel?.text = contacts[indexPath.row].name
 //        cell.contact = contacts[indexPath.row]
 //
 //        return cell
 //    }
 //
 //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 //        return 100
 //    }
 //


 }

 */
