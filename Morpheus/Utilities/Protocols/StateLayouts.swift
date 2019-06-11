//
//  StateLayouts.swift
//  Morpheus
//
//  Created by Alvin Joseph Valdez on 11/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

public protocol StateLayouts: class {
    func normalState()
    func expandedState()
    func beneathState()
}
