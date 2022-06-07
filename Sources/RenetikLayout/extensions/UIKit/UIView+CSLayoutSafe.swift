//
// Created by Rene Dohan on 1/29/20.
//

import UIKit

public extension UIView {

    var safeWidth: CGFloat {
        get { frame.size.width - safeAreaInsets.left - safeAreaInsets.right }
    }
    var safeHeight: CGFloat {
        get { frame.size.height - safeAreaInsets.top - safeAreaInsets.bottom }
    }

    var safeSize: CGSize {
        get { CGSize(width: safeWidth, height: safeHeight) }
    }
}
