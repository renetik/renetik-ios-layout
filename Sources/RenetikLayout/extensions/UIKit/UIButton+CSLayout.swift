public extension UIButton {

    @discardableResult
    class func construct(image: UIImage) -> Self { construct().image(image) }
    
    @discardableResult
    override func construct() -> Self {
        super.construct().aspectFit().resizeToFit()
        return self
    }
    
    func floatingDown(distance: CGFloat = 25) -> Self {
        from(bottom: distance, right: distance)
        if UIDevice.isTablet { resize(padding: 5) }
        imageEdgeInsets = UIEdgeInsets(UIDevice.isTablet ? 20 : 15)
        return self
    }
    
    func floatingUp(distance: CGFloat = 25) -> Self {
        from(top: distance, right: distance)
        if UIDevice.isTablet { resize(padding: 5) }
        imageEdgeInsets = UIEdgeInsets(UIDevice.isTablet ? 20 : 15)
        return self
    }
}

