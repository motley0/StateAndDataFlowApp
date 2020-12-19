//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $user.name)
                Text(String(user.name.count))
                    .foregroundColor(
                        user.name.count < 3 ? .red : .green
                    )
            }
            .multilineTextAlignment(.center)
            
            Button(action: {
                user.isRegistered = true
            }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(user.name.count < 3)
        }.padding()
    }
}

struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
            .environmentObject(UserManager())
    }
}
