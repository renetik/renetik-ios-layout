public extension UIImageView {
    override func construct() -> Self {
        super.construct().aspectFit().clipsToBounds()
        return self
    }
}