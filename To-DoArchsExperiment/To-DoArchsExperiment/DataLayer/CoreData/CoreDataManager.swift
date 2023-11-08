//
//  CoreDataManager.swift
//  To-DoArchsExperiment
//
//  Created by Юлія Воротченко on 07.11.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores \(error)")
            }
        }
        return container
    }()
    
    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        self.saveContext(mainContext)
    }
    
    private func saveContext(_ context: NSManagedObjectContext) {
        if context.parent == mainContext {
            
        }
        
        context.perform {
            do {
                try context.save()
            } catch let error as NSError {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
    
    func saveDerivedContext(_ context: NSManagedObjectContext) {
        context.perform { [self] in
            do {
                
            } catch let error as NSError {
                fatalError("\(error.localizedDescription)")
            }
            
            self.saveContext(mainContext)
        }
    }
}
