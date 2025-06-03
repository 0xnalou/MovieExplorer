//
//  UsecaseAssembly.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

final class UsecaseAssembly: Assembly {
    func assemble(container: Container) {
//        // SubmitTransactionUseCase
//        container.register(SubmitTransactionUseCase.self) { resolver in
//            guard let transactionRepository = resolver.resolve(TransactionRepository.self) else {
//                fatalError("cannot resolve \(TransactionRepository.self)")
//            }
//            
//            guard let storageReposity = resolver.resolve(StorageRepository.self) else {
//                fatalError("cannot resolve \(StorageRepository.self)")
//            }
//            
//            return SubmitTransactionUseCaseImpl(
//                transactionRepository: transactionRepository,
//                storageRepository: storageReposity
//            )
//        }.inObjectScope(.container)
//        
//        // RequestSSConfigUseCase
//        container.register(RequestSSConfigUseCase.self) { resolver in
//            guard let userRepository = resolver.resolve(UserRepository.self) else {
//                fatalError("Cannot resolve \(AppSessionManagerProtocol.self)")
//            }
//            
//            guard let sessionManager = resolver.resolve(AppSessionManagerProtocol.self) else {
//                fatalError("Cannot resolve \(AppSessionManagerProtocol.self)")
//            }
//            
//            return RequestSSConfigUseCaseImpl(
//                repository: userRepository,
//                sessionManager: sessionManager
//            )
//        }.inObjectScope(.container)
//        
//        // UpdateFCMDeviceTokenUseCase
//        container.register(UpdateFCMDeviceTokenUseCase.self) { resolver in
//            guard let repository = resolver.resolve(PushNotificationRespository.self) else {
//                fatalError("Can't resolve \(PushNotificationRespository.self)")
//            }
//            
//            return UpdateFCMDeviceTokenUseCaseImpl(repository: repository)
//        }.inObjectScope(.container)
//        
//        // LogTransactionUseCase
//        container.register(LogTransactionUseCase.self) { resolver in
//            guard let transactionRepository = resolver.resolve(TransactionRepository.self) else {
//                fatalError("cannot resolve \(TransactionRepository.self)")
//            }
//            
//            return LogTransactionUseCaseImpl(transactionRepository: transactionRepository)
//        }.inObjectScope(.container)
//        
//        container.register(ResetStorageUseCase.self) { resolver in
//            guard let storageReposity = resolver.resolve(StorageRepository.self) else {
//                fatalError("cannot resolve \(StorageRepository.self)")
//            }
//            
//            return ResetStorageUseCaseImpl(storageRepository: storageReposity)
//        }.inObjectScope(.container)
    }
}
