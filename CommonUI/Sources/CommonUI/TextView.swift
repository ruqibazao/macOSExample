//
//  SwiftUIView.swift
//  
//
//  Created by nenhall on 2022/11/6.
//

import SwiftUI

public struct TextView: NSViewRepresentable {
    @Binding public var isFirstResponder: Bool
    @Binding public var text: String

    public var configuration = { (view: NSScrollView) in }

    public init(text: Binding<String>, isFirstResponder: Binding<Bool>, configuration: @escaping (NSScrollView) -> () = { _ in }) {
        self.configuration = configuration
        self._text = text
        self._isFirstResponder = isFirstResponder
    }

    public func makeNSView(context: Context) -> NSScrollView {
        let view = NSTextView()
        view.string = "ghjkmng"
        view.becomeFirstResponder()
//        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.delegate = context.coordinator
        let scrollView = NSScrollView()
        scrollView.documentView = view
//        scrollView.frame = NSRect(x: 0, y: 0, width: 200, height: 108)
        return scrollView
    }

    public func updateNSView(_ uiView: NSScrollView, context: Context) {
        (uiView.documentView as? NSTextView)?.string = text
        configuration(uiView)
        (uiView.documentView as? NSTextView)?.becomeFirstResponder()
        switch isFirstResponder {
        case true: (uiView.documentView as? NSTextView)?.becomeFirstResponder()
        case false: (uiView.documentView as? NSTextView)?.resignFirstResponder()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator($text, isFirstResponder: $isFirstResponder)
    }

    public class Coordinator: NSObject, NSTextViewDelegate {
        var text: Binding<String>
        var isFirstResponder: Binding<Bool>

        init(_ text: Binding<String>, isFirstResponder: Binding<Bool>) {
            self.text = text
            self.isFirstResponder = isFirstResponder
        }

        func textShouldBeginEditing(notification: NSNotification) {

        }

        func textShouldEndEditing(notification: NSNotification) {

        }

        func textDidBeginEditing(notification: NSNotification) {
            self.isFirstResponder.wrappedValue = true
        }

        func textDidEndEditing(notification: NSNotification) {
            self.isFirstResponder.wrappedValue = false
        }

        func textDidChange(notification: NSNotification) {
            self.text.wrappedValue = (notification.object as? NSTextView)?.string ?? ""
        }

    }
}

