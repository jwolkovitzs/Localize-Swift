//
//  LocalizedSegmentedControl.swift
//  Localize_Swift
//
//  Created by Jason Wolkovitz on 1/8/18.
//  Copyright © 2018 SmartWolf. All rights reserved.
//

import UIKit

open class LocalizedSegmentedControl: UISegmentedControl {
    var tableName : String?
    open override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0..<self.numberOfSegments {
            let text = self.titleForSegment(at: i)?.localizedUI(using: tableName)
            self.setTitle(text, forSegmentAt: i)
        }
    }
}
