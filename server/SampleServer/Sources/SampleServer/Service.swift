//
//  Service.swift
//  SampleServer
//
//  Created by Volkov Alexander on 10/12/19.
//

import Foundation
import PerfectHTTP
import PerfectCRUD
import PerfectPostgreSQL

class Service {
    
    /// the database reference
    var database: Database<PostgresDatabaseConfiguration>!
    
    // shared instance
    static let shared = Service()
    
    var table: Table<Model, Database<PostgresDatabaseConfiguration>> {
        return database.table(Model.self)
    }
    
    // Initializer. Creates connection.
    init() {
        do {
            let db = Database(configuration: try PostgresDatabaseConfiguration(
                database: Configuration.databaseName,
                host: Configuration.databaseHost,
                username: Configuration.databaseUser,
                password: Configuration.databasePassword))
            
            // Create the table if it hasn't been done already.
            try db.create(Model.self, primaryKey: \.id, policy: .reconcileTable)
            self.database = db
        }
        catch let error {
            print("ERROR: \(error)")
        }
    }
    
    /// Create object
    func create(_ object: Model) throws -> Model {
        var o = object
        o.id = Int.rand().toUUID()
        try table.insert([o])
        return o
    }
    
    /// Update object
    func update(_ object: Model) throws {
        try table.where(\Model.id == object.id)
            .update(object)
    }
    
    /// Delete object
    func delete(_ object: Model) throws {
        guard let id = object.id else { throw "ID cannot be nil" }
        try delete(id: id)
    }
    
    /// Delete by ID
    func delete(id: UUID) throws {
        let query = table.where(\Model.id == id)
        try query.delete()
    }
    
    /// Select all objects
    func selectAll() throws -> [Model]  {
        let query = try table.select()
        var items = [Model]()
        for item in query {
            items.append(item)
        }
        return items
    }
    
    /// Select all objects
    func select(byId id: UUID) throws -> Model  {
        let query = try table.where(\Model.id == id).select()
        var items = [Model]()
        for item in query {
            items.append(item)
        }
        guard let item = items.first else { throw HTTPResponseError(status: .notFound, description: "Object with such ID is not found") }
        return item
    }
}

// Allow to throw strings as errors
extension String: Error { }
