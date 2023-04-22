//
//  TabBarController.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    let vc1 = ThemeViewController()
    let vc2 = LikesViewController()
    let vc3 = RecordViewController()
    let vc4 = MyInformationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.title = "테마"
        nav2.title = "찜"
        nav3.title = "기록"
        nav4.title = "내 정보"
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        tabBar.tintColor = .orange
        
        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(systemName: "square.grid.2x2")
        items[1].image = UIImage(systemName: "heart")
        items[2].image = UIImage(systemName: "list.bullet.clipboard")
        items[3].image = UIImage(systemName: "person")
    }
    

}
