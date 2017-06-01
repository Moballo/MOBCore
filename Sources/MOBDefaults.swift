//
//  MOBDefaults.swift
//  MOBCore
//
//  Created by Jason Morcos on 12/4/15.
//  Copyright © 2017 Moballo, LLC. All rights reserved.
//

import UIKit

public class MOBDefaults: NSObject {
    internal let localInstance:MOBDefaultsUser
    internal let groupInstance:MOBDefaultsUser?
    internal let cloudInstance:MOBDefaultsCloud?
    internal let keychainInstance:MOBDefaultsKeychain?
    internal let groupKey:String?
    internal let keychainKey:String?
    public init(group: String?, keychain: String?) {
        self.groupKey = group
        self.keychainKey = keychain
        localInstance = MOBDefaultsUser()
        if let groupName = group {
            groupInstance = MOBDefaultsUser(suiteName: groupName)
        } else {
            groupInstance = nil
        }
        cloudInstance = MOBDefaultsCloud()
        if let keychainName = keychain {
            keychainInstance = MOBDefaultsKeychain(accessGroup: keychainName)
        } else {
            keychainInstance = nil
        }
    }
    public func local() -> UserDefaults {
        return localInstance
    }
    public func group() -> UserDefaults? {
        return groupInstance
    }
    public func cloud() -> MOBDefaultsCloud? {
        return cloudInstance
    }
    public func keychain() -> MOBDefaultsKeychain? {
        return keychainInstance
    }
}
