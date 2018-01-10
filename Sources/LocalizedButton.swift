//
//  LocalizedButton.swift
//  DealerRater
//
//  Created by Jason Wolkovitz on 1/5/18.
//  Copyright © 2018 SmartWolf. All rights reserved.
//

import UIKit

open class LocalizedButton: UIButton {
    var tableName : String?
    open override func awakeFromNib() {
        super.awakeFromNib()
        let title = self.title(for: .normal)?.localizedUI(using: tableName)
        setTitle(title, for: .normal)
    }
}
