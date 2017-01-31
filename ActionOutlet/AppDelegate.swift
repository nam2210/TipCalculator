//
//  AppDelegate.swift
//  ActionOutlet
//
//  Created by Nam Pham on 1/29/17.
//  Copyright © 2017 Nam Pham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var startTime : Int64 = 0;
    var isReset : Bool = false;

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("app enter background");
        let timeInMilliseconds = Date().timeIntervalSince1970
        startTime = Int64(timeInMilliseconds * 1000)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("app enter foreground");
        let timeInMilliseconds = Date().timeIntervalSince1970
        let duration = (Int64(timeInMilliseconds * 1000) - startTime) / (1000);
        print("duration:  \(duration)");
        if (duration > (10 * 60)){
            isReset = true;
            var myViewController : ViewController!
            if let viewControllers = self.window?.rootViewController?.childViewControllers {
                for viewController in viewControllers {
                    if viewController.isKind(of: ViewController.self) {
                        myViewController = viewController as! ViewController
                        print("Found the view controller");
                        myViewController.reset();
                    }
                }
            }
            
        }
        
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

