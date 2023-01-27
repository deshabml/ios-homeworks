//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Лаборатория on 22.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func createFirstController() -> UINavigationController {
        let fvc = UINavigationController(rootViewController: FeedViewController())
        fvc.tabBarItem = UITabBarItem(title: "Лента пользователя", image: UIImage(systemName: "lineweight"), tag: 0)
        return fvc
    }

    func createSecondController() -> UINavigationController {
        let lvc = UINavigationController(rootViewController: LogInViewController())
        lvc.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
        return lvc
    }

    func creatTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 1.0)
        tabBar.tabBar.tintColor = UIColor(named: "ColorSet")
        return tabBar
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = creatTabBar()
        window.makeKeyAndVisible()

        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

