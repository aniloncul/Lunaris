//
//  ScaleButtonStyle.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 4/7/2023.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(x: configuration.isPressed ? 0.98 : 1.0, y: configuration.isPressed ? 0.98 : 1.0)
    }

}
