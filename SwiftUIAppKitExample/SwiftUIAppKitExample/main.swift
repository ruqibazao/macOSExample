//
//  main.swift
//  SwiftUIAppKitExample
//
//  Created by nenhall on 2022/11/6.
//

import AppKit

autoreleasepool {
    let app = NSApplication.shared
    let delegate = AppDelegate()
    app.appearance = NSAppearance(named: .darkAqua)
    app.delegate = delegate
    app.run()
}
