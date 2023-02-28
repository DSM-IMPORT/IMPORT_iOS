//
//  TabBarViewController.swift
//  Import
//
//  Created by 박준하 on 2023/01/30.
//

import UIKit
import Then
import SnapKit

@available(iOS 16.0, *)
class TapBarViewController: UITabBarController {
    private lazy var homeViewController: UINavigationController = {
        let viewController = HomeViewController()
        let tabBarItem = UITabBarItem(title: "도원준", image: UIImage(systemName: "house.fill"), tag: 0)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        tabBar.tintColor = .red
        return navigationView
    }()
    
    private lazy var chattingViewController: UIViewController = {
        let viewController = ChattingViewController()
        let tabBarItem = UITabBarItem(title: "비밀", image: UIImage(systemName: "lock.fill"), tag: 1)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var recruitmentViewController: UIViewController = {
        let viewController = RecruitmentViewController()
        let tabBarItem = UITabBarItem(title: "사진", image: UIImage(systemName: "photo.fill"), tag: 2)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var userViewController: UIViewController = {
        let viewController = UserViewController()
        let tabBarItem = UITabBarItem(title: "유저", image: UIImage(systemName: "photo.fill"), tag: 3)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController, chattingViewController, recruitmentViewController, userViewController]
        configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 90
        tabFrame.origin.y = self.view.frame.size.height - 90
        self.tabBar.frame = tabFrame
    }
}

extension UITabBarController {
    
    func configureTabBar() {
        self.tabBar.tintColor = .label
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        //        self.tabBar.layer.borderWidth = 0.4
    }
}
