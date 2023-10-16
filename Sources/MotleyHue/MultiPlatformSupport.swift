//
//  MultiPlatformSupport.swift
//  
//
//  Created by Kjeld Groot on 22/06/2023.
//

import SwiftUI

#if os(macOS)
import AppKit
public typealias MHCrossPlatformFont = NSFont
public typealias MHCrossPlatformColor = NSColor
public typealias MHCrossPlatformImage = NSImage
public typealias MHCrossPlatformViewController = NSViewController
public typealias MHCrossPlatformHostingController = NSHostingController
#else
import UIKit
public typealias MHCrossPlatformFont = UIFont
public typealias MHCrossPlatformColor = UIColor
public typealias MHCrossPlatformImage = UIImage
public typealias MHCrossPlatformViewController = UIViewController
public typealias MHCrossPlatformHostingController = UIHostingController
#endif
