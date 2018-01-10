//
//  String+LocalizedBundleTableName.swift
//  Localize_Swift
//
//  Created by Vitalii Budnik on 10/7/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import Foundation

/// bundle & tableName friendly extension
public extension String {
    
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString.
     
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - returns: The localized string.
     */
    func localized(using tableName: String? = nil, tables:[String]? = nil, in bundle: Bundle?) -> String {
        func localizedString(bundle: Bundle? = nil) -> String {
            var localizedString = ""
            var tableNames : [String] = []
            if let tableName = tableName {
                tableNames.append(tableName)
            } else if let tables = tables {
                tableNames.append(contentsOf: tables)
            }
            let noLocalizedString = "no localized string"
            if let bundle = bundle {
                for i in 0..<tableNames.count {
                    localizedString = bundle.localizedString(forKey: self, value: noLocalizedString, table: tableNames[i])
                    if localizedString != noLocalizedString {
                        break
                    }
                }
                if localizedString.count == 0 {
                    localizedString = bundle.localizedString(forKey: self, value: noLocalizedString, table: nil)
                }
            }
            if localizedString == noLocalizedString {
                #if LOCALIZATION_DEBUG
                    print("\(noLocalizedString) => \(self)")
                    return "##\(self)##"
                #else
                    return self
                #endif
            }
            return localizedString
        }
        let bundle: Bundle = .main
        if let path = bundle.path(forResource: Localize.currentLanguage(), ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return localizedString(bundle: bundle)
        }
        else if let path = bundle.path(forResource: LCLBaseBundle, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return localizedString(bundle: bundle)
        }
        return localizedString()
    }

    /**
     Swift 2 friendly localization syntax with format arguments, replaces String(format:NSLocalizedString).
     
     - parameter arguments: arguments values for temlpate (substituted according to the user’s default locale).
     
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - returns: The formatted localized string with arguments.
     */
    func localizedFormat(arguments: CVarArg..., using tableName: String?, in bundle: Bundle?) -> String {
        return String(format: localized(using: tableName, in: bundle), arguments: arguments)
    }
    
    /**
     Swift 2 friendly plural localization syntax with a format argument.
     
     - parameter argument: Argument to determine pluralisation.
     
     - parameter tableName: The receiver’s string table to search. If tableName is `nil`
     or is an empty string, the method attempts to use `Localizable.strings`.
     
     - parameter bundle: The receiver’s bundle to search. If bundle is `nil`,
     the method attempts to use main bundle.
     
     - returns: Pluralized localized string.
     */
    func localizedPlural(argument: CVarArg, using tableName: String?, in bundle: Bundle?) -> String {
        return NSString.localizedStringWithFormat(localized(using: tableName, in: bundle) as NSString, argument) as String
    }
    
}
