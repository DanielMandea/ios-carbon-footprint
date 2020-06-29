//
//  ModalTransition.swift
//  Donations
//
//  Created by Daniel Mandea on 25/06/2020.
//  Copyright © 2020 IBM CJ COVID. All rights reserved.
//

import SwiftUI

enum ModalTransition: TransitionLinkType {
    case fullScreenModal
    case scale

    var transition: AnyTransition {
        switch self {
        case .fullScreenModal:
            return .move(edge: .bottom)
        case .scale:
            return .scale(scale: 0)
        }
    }
}
