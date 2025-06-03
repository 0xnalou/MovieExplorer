//
//  Color.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import SwiftUI

public extension MovieExplorer {
    static let colorsBaceWhite = Color(UIColor { $0.userInterfaceStyle == .light ? UIColor("#FFFFFF") : UIColor("#222428") })
    
    static let colorRedTertiary = Color(UIColor { $0.userInterfaceStyle == .light ? UIColor(Color("#F87171")) : UIColor(Color("#AC3131")) })
    static let colorRedPrimary = Color(UIColor { $0.userInterfaceStyle == .light ? UIColor(Color("#FEF9F9")) : UIColor(Color("#210909")) })
    static let colorRedSecondary = Color(UIColor { $0.userInterfaceStyle == .light ? UIColor(Color("#B91C1C")) : UIColor(Color("#F58E8E")) })
    
}
