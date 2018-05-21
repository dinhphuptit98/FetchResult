//
//  CoreDataServices.swift
//  FetchResult
//
//  Created by dinhphu98 on 5/8/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit
import CoreData

class CoreDataServices {
    static let shared: CoreDataServices = CoreDataServices()
    
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController<Hero> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Hero> = Hero.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: "Master")
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    private var _fetchedResultsController: NSFetchedResultsController<Hero>?
    
    func saveContext() {
        // Save the context.
        guard let context = _fetchedResultsController?.managedObjectContext else { return }
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

