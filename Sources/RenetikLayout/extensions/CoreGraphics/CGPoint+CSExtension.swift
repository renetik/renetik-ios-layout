//
// Created by Rene Dohan on 2/12/20.
//

import Foundation
import CoreGraphics

public extension CGPoint {

    init(left: CGFloat, top: CGFloat) {
        self.init(x: left, y: top)
    }

    func distance(from point: CGPoint) -> CGFloat {
        ((x - point.x) * (x - point.x) + (y - point.y) * (y - point.y)).squareRoot()
    }

    var left: CGFloat { x }

    var top: CGFloat { y }
}
