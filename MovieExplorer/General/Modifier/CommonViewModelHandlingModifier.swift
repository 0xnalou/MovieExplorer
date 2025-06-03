//
//  CommonViewModelHandlingModifier.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import SwiftUI

struct CommonViewModelHandlingModifier: ViewModifier {
    @EnvironmentObject var globalUIState: AppEnvironmentAggregator.GlobalUIState
    @ObservedObject var viewModel: BaseViewModelImpl

    func body(content: Content) -> some View {
        content
            .onReceive(viewModel.commonState.toastPublisher) { toast in
                withAnimation {
                    globalUIState.toast = toast
                }
            }
            .onAppear {
                viewModel.commonAction.onViewAppear()
            }
    }
}
