//
//  HUDWindow.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import SwiftUI

struct HUDWindow: View {
    @EnvironmentObject var globalUIState: AppEnvironmentAggregator.GlobalUIState
    
    var body: some View {
        Color.clear
            .ignoresSafeArea()
            .toastView(toast: $globalUIState.toast)
    }
}
