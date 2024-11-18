//
//  DatabaseManager.swift
//  JurixMail
//
//  Created by David Scott on 11/16/24.
//

import SQLite
import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    private var db: Connection?
    private let databaseQueue = DispatchQueue(label: "com.jurixmail.database.queue")

    // Table definitions
    private let emailThreads = Table("EmailThreads")
    private let id = SQLite.Expression<Int64>("id")
    private let subject = SQLite.Expression<String>("subject")
    private let metadata = SQLite.Expression<String>("metadata")
    private let lastUpdated = SQLite.Expression<String>("lastUpdated")

    private let userPreferences = Table("UserPreferences")
    private let key = SQLite.Expression<String>("key")
    private let value = SQLite.Expression<String>("value")

    private let aiMemory = Table("AIMemory")
    private let memoryKey = SQLite.Expression<String>("key")
    private let memoryValue = SQLite.Expression<String>("value")
    private let memoryUpdated = SQLite.Expression<String>("lastUpdated")

    private let versionTable = Table("Version")
    private let version = SQLite.Expression<Int>("version")

    init() {
        setupDatabase()
    }

    // Set up the database and create tables
    private func setupDatabase() {
        do {
            let fileManager = FileManager.default
            guard let appSupportDirectory = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
                fatalError("Unable to locate Application Support directory.")
            }
            let dbURL = appSupportDirectory.appendingPathComponent("JurixMail.db")

            // Ensure directory exists
            if !fileManager.fileExists(atPath: appSupportDirectory.path) {
                try fileManager.createDirectory(at: appSupportDirectory, withIntermediateDirectories: true, attributes: nil)
            }

            db = try Connection(dbURL.path)
            print("Database initialized at: \(dbURL.path)")
            createTables()
        } catch {
            print("Database setup failed: \(error)")
        }
    }

    // Create necessary tables
    private func createTables() {
        databaseQueue.sync {
            do {
                try db?.run(emailThreads.create(ifNotExists: true) { t in
                    t.column(id, primaryKey: true)
                    t.column(subject)
                    t.column(metadata)
                    t.column(lastUpdated)
                })
                try db?.run(userPreferences.create(ifNotExists: true) { t in
                    t.column(key, primaryKey: true)
                    t.column(value)
                })
                try db?.run(aiMemory.create(ifNotExists: true) { t in
                    t.column(memoryKey, primaryKey: true)
                    t.column(memoryValue)
                    t.column(memoryUpdated)
                })
                try db?.run(versionTable.create(ifNotExists: true) { t in
                    t.column(version, primaryKey: true)
                })
                print("Tables created successfully.")
            } catch {
                print("Error creating tables: \(error)")
            }
        }
    }
}
