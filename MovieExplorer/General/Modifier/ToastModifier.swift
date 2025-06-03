//
//  ToastModifier.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    @State private var cancellable: AnyCancellable?
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            
            if let toast {
                toasterView(toast)
            }
        }
    }
    
    private func toasterView(_ toast: Toast) -> some View {
        HeaderToasterView(title: toast.title,
                          subtitle: toast.subtitle,
                          icon: Image(toast.icon)) {
            dismissToast()
        }
                          .padding(.horizontal, MovieExplorer.size24)
                          .padding(.top, MovieExplorer.size24)
                          .transition(AnyTransition
                            .move(edge: .top)
                            .combined(with: .opacity)
                            .animation(.easeInOut(duration: 0.25))
                          )
                          .onAppear {
                              startTimer()
                          }
                          .onDisappear {
                              invalidateTimer()
                          }
    }
    
    private func startTimer() {
        cancellable = Timer.publish(every: 5, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                dismissToast()
            }
    }
    
    private func invalidateTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
    }
}
