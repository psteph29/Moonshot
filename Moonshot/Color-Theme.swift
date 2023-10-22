//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Paige Stephenson on 10/21/23.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}

//This extension allows you to use these colors everywhere SwiftUI expects a ShapeStyle. Color conforms to a bigger protocol called ShapeStyle, which is what lets you use colors, gradients, materials, etc. as if they were the same thing. The ShapeStyle protocol is what the background() modifier uses, so what you are doing is extending Color in a way that all the SwiftUI modifiers using ShapeStyle work too.
//This extenshion is basically saying "we want to add functionality to ShapeStype, but only for times when it's being used as a color"
