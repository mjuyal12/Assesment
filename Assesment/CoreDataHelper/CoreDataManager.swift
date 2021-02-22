//
//  CoreDataManager.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Assesment")
        persistentContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveWeather(data: Data) {
        let entity = NSEntityDescription.entity(forEntityName: "WeatherList", in: moc)
        let newObject = NSManagedObject(entity: entity!, insertInto: moc)
        //let weatherList = WeatherList(context: moc)
        newObject.setValue(data, forKey: "weather")
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchWeatherDetails() -> [WeatherList]? {
        do {
            let fetchRequest = NSFetchRequest<WeatherList>(entityName: "WeatherList")
            let object = try moc.fetch(fetchRequest)
            print(object)
            return object
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    // MARK: - Core Data Saving support

    func saveContext () {
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
