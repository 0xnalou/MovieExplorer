//
//  AppStartViewModel.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation
import SwiftUI
import MVVMCModule

final class AppStartViewModel: BaseViewModelImpl, BaseViewModel {
    // MARK: - State
    @Published private(set) var state: AppStartState
    
    // MARK: - Action
    var action: AppStartAction {
        return AppStartAction()
    }
    
    private let toastSubject = PassthroughSubject<Toast?, Never>()
    private let showMovieListScreenSubject = PassthroughSubject<Void, Never>()
    
    override init() {
        self.state = AppStartState(showToast: toastSubject.asDriver(),
                                   showMovieListScreen: showMovieListScreenSubject.asDriver())
        
        super.init()
        
    }
    
    override func onViewAppear() {
        super.onViewAppear()
        
    }
}
