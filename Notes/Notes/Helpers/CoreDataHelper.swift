import UIKit
import CoreData
import Foundation

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }

        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext

        return context
    }()
    
    //class method for creation
    static func newNote() -> Note {
            let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note

            return note
    }
    
    //class method for saving
    static func saveNote() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    //class method for deletion
    static func delete(note: Note) {
        context.delete(note)

        saveNote()
    }
    
    //class method for retrieval
    static func retrieveNotes() -> [Note] {
        do {
            let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
            let results = try context.fetch(fetchRequest)

            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")

            return []
        }
    }
}


