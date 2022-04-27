//
//  UserStorage.swift
//  CoreDataBase
//
//  Created by dorellana on 26/04/22.
//

import Foundation
import CoreData
import SwiftUI

class UserStorage: ObservableObject, StorageProtocol {
        
    private var context: NSManagedObjectContext
    
    @Published var currentUser: Any?
    @Published var isSaveUserSuccess: Bool = false
    
    init() {
        self.context = PersistenceController.shared.container.viewContext
    }
    
    func save(_ name: String?) {
        guard let nameUser = name else {
            print("Error")
            return
        }
        
        let user = User(context: context)
        user.id = UUID()
        user.name = nameUser
        
        do {
            try context.save()
            isSaveUserSuccess = true
            get()
        } catch let error as NSError {
            print("DBError: \(error.localizedDescription)")
            isSaveUserSuccess = false
        }
    }
    
    func get() {
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let data = try context.fetch(request)
            
            for user in data {
                print(user.name ?? "Not name")
            }
        } catch let error as NSError {
            print("DBError: \(error.localizedDescription)")
        }
    }
    
}
