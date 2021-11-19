//
//  TabBar.swift
//  Nano7App
//
//  Created by Luiz Araujo on 17/11/21.
//

import UIKit

class TabBar: UITabBarController {
//    //MARK:- Variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = UIColor(named: "tabBar-icon-background")!
        self.tabBar.tintColor = UIColor.init(named: "tabBar-icon-selected")
        self.tabBar.unselectedItemTintColor = UIColor.init(named: "tabBar-icon-unselected")
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
        
        
        
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
        
       }

    
    func setupVCs() {
        viewControllers = [
//            createNavController(for: FavoritosViewController(), title: NSLocalizedString("Favoritos", comment: ""), image: UIImage(systemName: "heart")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Mapa", comment: ""), image: UIImage(systemName: "globe")!),
            createNavController(for: ConfigurationViewController(), title: NSLocalizedString("Configuração", comment: ""), image: UIImage(systemName: "gearshape")!)
        ]
    }
    
    
    //Se precisar criar um navigationController
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
}


//extension UITabBar {
//    override open func sizeThatFits(size: CGSize) -> CGSize {
//        super.sizeThatFits(size)
//        var sizeThatFits = super.sizeThatFits(size)
//        sizeThatFits.height = 71
//        return sizeThatFits
//    }
//}
