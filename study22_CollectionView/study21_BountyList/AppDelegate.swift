//
//  AppDelegate.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/* Table view : 반복적으로 동일내용을 리스트로 보여주기 위한 장치 */
// recycle 형태로 Table view cell이 반복적으로 채워지는 형식
// 필수 - 테이블뷰 셀이 몇개?
// 필수 - 테이블뷰 어떻게 보여주나?
// 추가 - 테이블뷰 클릭하면 어떻게하나?

/* protocol : 해야할 일의 목록 */
// 테이블뷰 서비스를 쓰기 위해 해야할 일

// 필수 - 테이블뷰 셀이 몇개? -> UITableViewDataSource
// 필수 - 테이블뷰 어떻게 보여주나? -> UITableViewDelegate
// 추가 - 테이블뷰 클릭하면 어떻게하나? -> UITableViewDelegate
