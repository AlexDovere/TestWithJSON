//
//  NetworkReachability.swift
//  TestWithJSON
//
//  Created by Alessandro Dovere on 01/02/22.
//

import Foundation
import SystemConfiguration

class NetworkReachability: ObservableObject {
    @Published private(set) var isReachable: Bool = false
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "https://jsonplaceholder.typicode.com")

    init() {
        self.isReachable = checkConnection()
    }

    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let connectionRequired = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutIntervention = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!connectionRequired || canConnectWithoutIntervention)
    }

    func checkConnection() -> Bool {
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)

        return isNetworkReachable(with: flags)
    }
}
