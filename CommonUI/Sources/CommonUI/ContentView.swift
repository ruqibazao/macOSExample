//
//  ContentView.swift
//  
//
//  Created by nenhall on 2022/11/6.
//

import SwiftUI

public struct ContentView: View {

    @State var text: String = ""
    @State var isFirstResponder = true

    public init() { }

    public var body: some View {
        VStack {
           textView
        }
        .frame(width: 960, height: 540)
    }

    var textView: some View {
        VStack {
            //        let binding: Binding<String> = (get: {
            //            text
            //        } set: {
            //            text = $0
            //        })
//            if #available(macOS 13.0, *) {
//                let lines = 3
//                TextEditor(text: $text)
//                    .frame(maxWidth: .infinity, maxHeight: CGFloat(lines * 24))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color(NSColor.lightGray))
//                    )
//            } else {
//                TextField("xxx", text: $text)
//            }

            ScrollView(showsIndicators: true) {

            }
            .frame(width: 200, height: 108)
            
            TextView(text: $text, isFirstResponder: $isFirstResponder) {
                $0.backgroundColor = .red
            }
            .frame(width: 200, height: 108)

            Button {
                NSApp.sendAction(#selector(NSText.selectAll(_:)), to: nil, from: nil)
            } label: {
                Text("dfghj")
            }

        }
        .frame(width: 200, height: 108)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
