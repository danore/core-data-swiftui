//
//  ContentView.swift
//  CoreDataBase
//
//  Created by dorellana on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Button {
                userViewModel.saveUser("User\(count)")
                count += 1
            } label: {
                Text("Save User")
                    .foregroundColor(.black)
            }
        }
    }
}
