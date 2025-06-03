//
//  StorageRepositoryImpl.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import RealmSwift

final actor StorageRepositoryImpl: StorageRepository {
    
    private static let storageVersion: UInt64 = 1
    private var realm: Realm?
    private var lazyRealm: Realm? {
        get async throws {
            if let realm {
                return realm
            } else {
                realm = try await initRealm()
                return realm
            }
        }
    }
    
    func store(movies: [MovieModel]) async throws {
        guard let realm = try await lazyRealm else {
            return
        }
        
        do {
            try realm.write {
                for item in movies {
                    let realmModel = item.asRMMovie
                    realm.add(realmModel, update: .modified)
                }
            }
            
        } catch {
            throw error
        }
    }
    
    func store(movie: MovieModel) async throws {
        guard let realm = try await lazyRealm else {
            return
        }
        
        do {
            try realm.write {
                let realmModel = movie.asRMMovie
                realm.add(realmModel, update: .modified)
            }
            
        } catch {
            throw error
        }
    }
    
    func delete(movie: MovieModel) async throws {
        guard let realm = try await lazyRealm else {
            return
        }
        
        guard let realmModel = realm.object(ofType: RMMovie.self, forPrimaryKey: movie.id) else {
            return
        }
        
        do {
            try await realm.asyncWrite {
                realm.delete(realmModel)
            }
        } catch {
            throw error
        }
    }
    
    func fetchAllMovie() async throws -> [MovieModel] {
        guard let realm = try await lazyRealm else {
            return []
        }
        
        let rmTransactions = realm.objects(RMMovie.self)
        return rmTransactions.map { $0.toMovieModel }
    }
    
    func resetStorage() async throws {
        guard let realm = try await lazyRealm else {
            return
        }
        
        do {
            try await realm.asyncWrite {
                realm.deleteAll()
            }
        } catch {
            throw error
        }
    }
}

private extension StorageRepositoryImpl {
    
    func initRealm() async throws -> Realm? {
        let config = Realm.Configuration(schemaVersion: Self.storageVersion)
        do {
            let realm = try await Realm(configuration: config, actor: self)
            return realm
        } catch {
            throw error
        }
    }
}
