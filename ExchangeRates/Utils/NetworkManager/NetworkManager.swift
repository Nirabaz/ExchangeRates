//
//  NetworkManager.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/27/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit
import Reachability

class NetworkManager: NSObject {

    static let sharedManager = NetworkManager()
    private let reachability = Reachability()!

    private override init() {
        super.init()
        observeInternetConnection()
        print("SELNetworkManager - init")
    }

    private func observeInternetConnection() {
        // Internet is reachable
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }

            NotificationCenter.default.post(name: .NetworkDidBecomeReachableNotification, object: nil)
        }

        // Internet is not reachable
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            NotificationCenter.default.post(name: .NetworkDidBecomeUnreachableNotification, object: nil)
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    func isInternetReachable() -> Bool {
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            return true
        case .cellular:
            print("Reachable via Cellular")
            return true
        case .none:
            print("Network not reachable")
            return false
        }
    }
}

