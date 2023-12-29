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
        HStack {
            Text( "toggle" )
            Image(systemName: "arrow.right")
        }
            .padding(10)
            .background( toggle ? .red : .gray.opacity(0.5) )
            .cornerRadius(15)
            .onTapGesture { withAnimation {
                toggle.toggle()
            } }
    }
    
//    MARK: Body
    var body: some View {
        VStack {
            makeToggle()
                .padding(.bottom)
            
            HStack {
                Text("hello World!")
                Image(systemName: "globe.americas")
            }
            .padding(7)
            .if(!toggle) { view in
                view
                    .padding(7)
                    .background(Colors.lightAccentGreen)
                    .cornerRadius(20)
                    .bold(true)
                    .font(.title)
            }
            .if(toggle) { view in view.opacity(0.5) }
        }.padding(.vertical)
        
        Spacer()
    }
}

#Preview {
    ContentView()
}

//MARK: Colors
class Colors {
    static let lightGrey = makeColor(255, 255, 255)
    static let secondaryLightColor = makeColor( 235, 235, 235 )
    static let darkGrey = Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.9)
    static let accentGreen = makeColor(95, 255, 135)
    static let lightAccentGreen = makeColor(66, 122, 69)
    
    static let yellow = makeColor(234, 169, 40)
    static let pink = makeColor(198, 62, 120)
    static let purple = makeColor(106, 38, 153)
    static let grape = makeColor(70, 42, 171)
    static let blue = makeColor(69, 121, 251)
    static let red = makeColor(236, 81, 46)
    
    private static func makeColor( _ r: CGFloat, _ g: CGFloat, _ b: CGFloat ) -> Color {
        Color(red: r / 255, green: g / 255, blue: b / 255)
    }
}

