//
//  UITextField+Localized.swift
//  DealerRater
//
//  Created by Jason Wolkovitz on 1/5/18.
//  Copyright © 2018 SmartWolf. All rights reserved.
//

import UIKit

open class LocalizedTextField: UITextField {
    var tableName : String?
    open override func awakeFromNib() {
        super.awakeFromNib()
        placeholder = placeholder?.localizedUI(using: tableName)
    }
}
