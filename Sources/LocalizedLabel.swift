//
//  LocalizedLabel.swift
//  DealerRater
//
//  Created by Jason Wolkovitz on 1/5/18.
//  Copyright © 2018 SmartWolf. All rights reserved.
//

import UIKit

open class LocalizedLabel: UILabel {
    var tableName : String?
    open override func awakeFromNib() {
        super.awakeFromNib()
        text = text?.localizedUI(using: tableName)
    }
}
