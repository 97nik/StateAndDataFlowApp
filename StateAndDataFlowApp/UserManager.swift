//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//

import Combine
import Foundation

class UserManager: ObservableObject {
    @Published var name: String =  UserDefaults.standard.string(forKey: "name")!  {
        didSet{
            UserDefaults.standard.set(self.name, forKey: "name")
        }
    }
    @Published var isRegistered : Bool =  UserDefaults.standard.bool(forKey: "isRegistered")   {
        didSet{
            UserDefaults.standard.set(self.isRegistered, forKey: "isRegistered")
        }
    }
}
