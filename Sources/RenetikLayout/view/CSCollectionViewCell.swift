//
// Created by Rene Dohan on 2/18/20.
//

import UIKit

open class CSCollectionViewCell: UICollectionViewCell {

//    @discardableResult
//    public func layout(function: @escaping Func) -> Self {
//        layoutFunctions.listen { function() }
//        function()
//        return self
//    }

//    @discardableResult
//    public func layout<View: UIView>(_ view: View, function: @escaping (View) -> Void) -> View {
//        layoutFunctions.listen { function(view) }
//        function(view)
//        return view
//    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews()
    }
}