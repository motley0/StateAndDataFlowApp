//
//  ButtonContentView.swift
//  StateAndDataFlowApp
//
//  Created by Dmitry Shcherbakov on 19.12.2020.
//

import SwiftUI

struct ButtonContentView: View {
    
    let action: () -> Void
    let buttonTitle: String
    let buttonColor: Color
    
    var body: some View {
        Button(action: action) {
            Text(buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContentView(action: {}, buttonTitle: "Start", buttonColor: .red)
    }
}
