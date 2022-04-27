//
//  UserViewModel.swift
//  CoreDataBase
//
//  Created by dorellana on 26/04/22.
//

import Foundation
import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @ObservedObject private var userStorage = UserStorage()
    var cancellables = [AnyCancellable]()
    
    init() {
        userStorage.$isSaveUserSuccess
            .receive(on: DispatchQueue.main)
            .sink { isSuccess in
                print(isSuccess ? "success" : "failure")
            }
            .store(in: &cancellables)
    }
    
    func saveUser(_ name: String) {
        userStorage.save(name)
    }
    
}
