//
//  ContentView.swift
//  ConditionalModifiersDemo
//
//  Created by Brian Masse on 12/29/23.
//

import SwiftUI

//MARK: if
extension View {
    @ViewBuilder
    func `if`<Content: View>( _ condition: Bool, contentBuilder: (Self) -> Content ) -> some View {
        if condition {
            contentBuilder(self)
        } else { self }
    }
}

//MARK: ContentView
struct ContentView: View {
    
    @State var toggle: Bool = false
    
    @ViewBuilder
    private func makeToggle() -> some View {
        
        Text( "toggle" )
            .padding()
            .background( toggle ? .red : .gray.opacity(0.5) )
            .cornerRadius(20)
            .onTapGesture { withAnimation {
                toggle.toggle()
            } }
    }
    
//    MARK: Body
    var body: some View {
        makeToggle()
            .padding(.bottom)
        
        Text("hello World!")
            .padding(7)
            .if(!toggle) { view in
                view
                    .padding(7)
                    .background(.red)
                    .cornerRadius(20)
                    .bold(true)
                    .font(.title)
            }
            .if(toggle) { view in view.opacity(0.5) }
    }
}

#Preview {
    ContentView()
}


