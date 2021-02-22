//
//  CoreDataManager.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import CoreData
import UIKit

class CoreDataManager {
    
    struct CoreDataConstant {
        static let model = "Assesment"
        static let entity = "WeatherList"
        
        enum Keys: String {
            case weather = "weather"
            
            var string: String {
                return self.rawValue
            }
        }
    }
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: CoreDataConstant.model)
        persistentContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveWeather(data: Data) {
        if let fetchedWeatherList = fetchWeatherDetails(),
            !fetchedWeatherList.isEmpty {
            fetchedWeatherList[0].setValue(data, forKey: CoreDataConstant.Keys.weather.string)
        } else {
            let weatherList = WeatherList(context: moc)
            weatherList.setValue(data, forKey: CoreDataConstant.Keys.weather.string)
        }
        saveContext()
    }
    
    func fetchWeatherDetails() -> [WeatherList]? {
        do {
            let fetchRequest = NSFetchRequest<WeatherList>(entityName: CoreDataConstant.entity)
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
                //fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
