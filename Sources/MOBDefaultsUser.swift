//
//  MOBDefaults.swift
//  MOBCore
//
//  Created by Jason Morcos on 11/23/16.
//  Copyright © 2016 CBTech. All rights reserved.
//

import UIKit

public class MOBDefaultsUser: UserDefaults {
    //Default value
    public func string(forKey keyName: String, defaultValue:String) -> String {
        if let val = self.string(forKey: keyName) as String? {
            return val
        }
        return defaultValue
    }
    public func bool(forKey keyName: String, defaultValue:Bool) -> Bool {
        if let val = self.bool(forKey: keyName) as Bool? {
            return val
        }
        return defaultValue
    }
    public func integer(forKey keyName: String, defaultValue:Int) -> Int {
        if let val = self.integer(forKey: keyName) as Int? {
            return val
        }
        return defaultValue
    }
    public func double(forKey keyName: String, defaultValue:Double) -> Double {
        if let val = self.double(forKey: keyName) as Double? {
            return val
        }
        return defaultValue
    }
    public func float(forKey keyName: String, defaultValue:Float) -> Float {
        if let val = self.float(forKey: keyName) as Float? {
            return val
        }
        return defaultValue
    }
    public func url(forKey keyName: String, defaultValue:URL) -> URL {
        if let val = self.url(forKey: keyName) as URL? {
            return val
        }
        return defaultValue
    }
    public func array(forKey keyName: String, defaultValue:Array<Any>) -> Array<Any> {
        if let val = self.array(forKey: keyName) {
            return val
        }
        return defaultValue
    }
    public func object(forKey keyName: String, defaultValue:Any) -> Any {
        if let val = self.object(forKey: keyName) {
            return val
        }
        return defaultValue
    }
    public func dictionary(forKey keyName: String, defaultValue:[String : Any]) -> [String : Any] {
        if let val = self.dictionary(forKey: keyName) {
            return val
        }
        return defaultValue
    }
    //setup methods with sync
    public func set(string: String, forKey keyName: String) {
        super.set(string, forKey: keyName)
        super.synchronize()
    }
    public func set(bool: Bool, forKey keyName: String) {
        super.set(bool, forKey: keyName)
        super.synchronize()
    }
    public func set(integer: Int, forKey keyName: String) {
        super.set(integer, forKey: keyName)
        super.synchronize()
    }
    public func set(double: Double, forKey keyName: String) {
        super.set(double, forKey: keyName)
        super.synchronize()
    }
    public func set(float: Float, forKey keyName: String) {
        super.set(float, forKey: keyName)
        super.synchronize()
    }
    public func set(url: URL, forKey keyName: String) {
        super.set(url, forKey: keyName)
        super.synchronize()
    }
    public func set(array: Array<Any>, forKey keyName: String) {
        super.set(array, forKey: keyName)
        super.synchronize()
    }
    public func set(object: Any, forKey keyName: String) {
        super.set(object, forKey: keyName)
        super.synchronize()
    }
    public func set(dictionary: [String : Any], forKey keyName: String) {
        super.set(dictionary, forKey: keyName)
        super.synchronize()
    }
    //override superclass methods
    public func set(_ string: String, forKey keyName: String) {
        super.set(string, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ bool: Bool, forKey keyName: String) {
        super.set(bool, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ integer: Int, forKey keyName: String) {
        super.set(integer, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ double: Double, forKey keyName: String) {
        super.set(double, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ float: Float, forKey keyName: String) {
        super.set(float, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ url: URL?, forKey keyName: String) {
        super.set(url, forKey: keyName)
        super.synchronize()
    }
    public override func set(_ object: Any?, forKey keyName: String) {
        super.set(object, forKey: keyName)
        super.synchronize()
    }
    public override func removeObject(forKey keyName: String) {
        super.removeObject(forKey: keyName)
        super.synchronize()
    }
}