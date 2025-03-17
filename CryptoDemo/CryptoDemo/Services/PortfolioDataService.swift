//
//  PortfolioDataService.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/17/25.
//

import CoreData
import Foundation

final class PortfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { [weak self] _, error in
            if let error {
                print("Error loading CoreData \(error)")
            }
            
            self?.fetchPortfolio()
        }
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: { $0.coinId == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
}

private extension PortfolioDataService {
    func fetchPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portfolio Entities. \(error)")
        }
    }
    
    func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinId = coin.id
        entity.amount = amount
        applyChange()
    }
    
    func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChange()
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error Saving CoreData \(error)")
        }
    }
    
    func applyChange() {
        save()
        fetchPortfolio()
    }
}
