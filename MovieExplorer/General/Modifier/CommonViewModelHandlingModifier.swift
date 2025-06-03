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
//            .onReceive(viewModel.commonState.toastPublisher) { toast in
//                withAnimation {
//                    globalUIState.toast = toast
//                }
//            }
//            .onReceive(viewModel.commonState.popupAlert) { popup in
//                globalUIState.popupAlert = popup
//            }
//            .onReceive(viewModel.commonState.fullscreenErrorPublisher) { error in
//                globalUIState.errorFullScreen = error
//            }
            .onAppear {
//                print("✏️ \(viewModel.typeName.replacingOccurrences(of: "ViewModel", with: "Screen")) is displayed")
                viewModel.commonAction.onViewAppear()
            }
    }
}
