//
//  ResultView.swift
//  App Extension
//
//  Created by Александр on 07.09.2022.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        Text("RESULT")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.green)
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)


    }

}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
