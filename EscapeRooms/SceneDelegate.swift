//
//  SceneDelegate.swift
//  EscapeRooms
//
//  Created by playhong on 2023/02/22.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: ThemeViewController())
        let vc2 = UINavigationController(rootViewController: LikesViewController())
        let vc3 = UINavigationController(rootViewController: RecordController())
        let vc4 = UINavigationController(rootViewController: MyInformationViewController())
        
        vc1.title = "테마"
        vc2.title = "찜"
        vc3.title = "기록"
        vc4.title = "내 정보"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.barTintColor = .white
        tabBarVC.tabBar.tintColor = .orange
        
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(systemName: "square.grid.2x2")
        items[1].image = UIImage(systemName: "heart")
        items[2].image = UIImage(systemName: "list.bullet.clipboard")
        items[3].image = UIImage(systemName: "person")
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

