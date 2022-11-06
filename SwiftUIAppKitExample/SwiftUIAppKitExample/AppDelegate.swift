//
//  AppDelegate.swift
//  SwiftUIAppKitExample
//
//  Created by nenhall on 2022/11/6.
//

import Cocoa
import SwiftUI
import CommonUI
//import i

public struct ContentView2: View {

    @State var text: String = ""
    @FocusState private var isFocusState: Bool

    public var body: some View {
        VStack {
           textView
        }
        .frame(width: 960, height: 540)
    }


    var textView: some View {
        VStack {
            if #available(macOS 13.0, *) {
                TextEditor(text: $text)
                    .frame(maxWidth: .infinity, maxHeight: CGFloat(3 * 24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(NSColor.lightGray))
                    )
                    .focusable(isFocusState) { change in
                        print(change)
                    }

            } else {
                TextField("xxx", text: $text)
            }

            Button {
                isFocusState = true
//                NSApp.performSelector(NSText., withObject: <#T##Any?#>, afterDelay: <#T##TimeInterval#>)
            } label: {
                Text("dfghj")
            }

        }
        .frame(width: 200, height: 108)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(macOS 12.0, *) {
            ContentView()
        } else {
            Text("12")
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var window: NSWindow = {
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 960, height: 540), styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: true)
        window.contentView = NSHostingView(rootView: ContentView())
        window.isReleasedWhenClosed = true
        window.center()
        return window
    }()
    lazy var windowController: NSWindowController = {
        NSWindowController(window: window)
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

