//
// Created by Rene Dohan on 12/22/19.
//

import UIKit

public protocol CSTableHeightCalculatingCell {
    associatedtype Row
    func height(for data: Row) -> CGFloat
}

open class CSTableViewCell: UITableViewCell {

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

    override open var reuseIdentifier: String? {
        if super.reuseIdentifier.notNil { return super.reuseIdentifier }
        return type(of: self).description()
    }
}