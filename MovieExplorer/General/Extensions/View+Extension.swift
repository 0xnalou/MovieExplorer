//
//  View+Extension.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import SwiftUI

extension View {
    func handleCommonViewModel(using viewModel: BaseViewModelImpl) -> some View {
        modifier(CommonViewModelHandlingModifier(viewModel: viewModel))
    }
    
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
