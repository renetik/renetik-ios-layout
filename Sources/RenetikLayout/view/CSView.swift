//
// Created by Rene Dohan on 12/22/19.
//

import UIKit
import Renetik

open class CSView: UIControl {

    @discardableResult
    open class func construct() -> Self { construct(defaultSize: true) }

    @discardableResult
    public class func construct(_ function: ArgFunc<CSView>) -> Self {
        let _self = construct(defaultSize: true)
        function(_self)
        return _self
    }

    @discardableResult
    override open func construct() -> Self {
        super.construct().defaultSize()
        onCreateLayout()
        onLayoutCreated()
        return self
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews()
    }

    @discardableResult
    open override func heightToFit() -> Self {
        if content.notNil {
            content!.heightToFit()
            let masks = saveAndClearSubviewsAutoresizingMasks()
            height(content!.height)
            restoreSubviewsAutoresizing(masks: masks)
        } else {
            heightToFitSubviews()
        }
        return self
    }

    @discardableResult
    open override func resizeToFit() -> Self {
        if content.notNil {
            content!.resizeToFit()
            let masks = saveAndClearSubviewsAutoresizingMasks()
            size(content!.size)
            restoreSubviewsAutoresizing(masks: masks)
        } else {
            resizeToFitSubviews()
        }
        return self
    }
}
