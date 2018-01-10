//
//  String+LocalizedUI.swift
//  Localize_Swift
//
//  Created by Jason Wolkovitz on 1/8/18.
//  Copyright © 2018 Jason Wolkovitz. All rights reserved.
//

import Foundation

public let localizedUITableName = "UILocalizable"
public let localizedTableName = "AlertLocalizable"

public extension String {
    
    /**
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - returns: The localized string.
     */
    func localizedUI(using table: String?) -> String {
        if let table = table {
            return self.localized(using: table, in: nil)
        }
        return self.localized(tables: [localizedUITableName, localizedTableName, "Localizable"], in: nil)
    }
}
