import CoreData
import Foundation
import UIKit.UIApplication


//MARK: - Final class CoreDataManager

final class CoreDataManager: NSCopying {

    
//MARK: - Singleton of class and defence from coping
    
    static let instance = CoreDataManager()
    
    private init() { }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return ""
    }
    
  
    
//MARK: - Save data method
    
    func saveData(name: String, surname: String, date: Date) -> Result<Void, CoreDataErrors> {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.error("AppDelegate not found"))}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Birthday", in: managedContext) else { return .failure(.error("Entity not found"))}
        
        let birthday = NSManagedObject(entity: entity, insertInto: managedContext)
        
        birthday.setValue(name, forKey: "name")
        birthday.setValue(surname, forKey: "surname")
        birthday.setValue(date, forKey: "date")
        
        do {
            try managedContext.save()
        } catch {
            return .failure(.error("Could not save"))
        }
        return .success(())
    }
    
    
    
//MARK: - Load data method
    
    func loadData() {
        
    }
}
