//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Aleksandr on 24.09.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var logFlag = true
    var currentState = UIApplication.shared.applicationState

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let functionName=#function
        getStateAndPrint(functionName)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let functionName=#function
        getStateAndPrint(functionName)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let functionName=#function
        getStateAndPrint(functionName)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let functionName=#function
        getStateAndPrint(functionName)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let functionName=#function
        getStateAndPrint(functionName)
    }
    
    func getStateAndPrint(_ functionName: String){
        if logFlag {
            let state = UIApplication.shared.applicationState
            if (state != currentState){
                print("Application moved from \(printState(currentState)) to \(printState(state)) : \(functionName)")
                currentState=state
            } else {
                print("Method: \(functionName), state: \(printState(state))")
            }
        }
    }
    
    func printState (_ state: UIApplication.State) -> String {
        switch state {
        case .active:
            return "active"
        case .inactive:
            return "inactive"
        case .background:
            return "background"
        }
    }
    

}

