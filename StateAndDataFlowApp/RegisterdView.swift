//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                СounterView(name: $name)
                    .padding()
                    .frame(width:60)
            }
            OkButtonView(user: _user, name: $name)
        }
    }
}

struct СounterView: View {
    
    @Binding var name: String
    var charactersCounts = 0
    
    init(name: Binding<String> ) {
        self._name = name
        charactersCounts = self._name.wrappedValue.count
    }
    
    var body: some View {
        Text("\(charactersCounts)")
            .font(.title3)
            .foregroundColor(changeNumsColor())
    }
    
    private func changeNumsColor()->Color {
        if charactersCounts < 3 {
            return .red
        } else { return .green }
    }
}

struct OkButtonView: View {
    
    @EnvironmentObject var user: UserManager
    @Binding var name: String
    
    var body: some View {
        Button(action: registerUser) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(!buttonIsValid)
        }
    }
    
    var buttonIsValid: Bool {
        if name.count < 3{
            return false
        } else { return true}
        }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
           .environmentObject(UserManager())
    }
}
