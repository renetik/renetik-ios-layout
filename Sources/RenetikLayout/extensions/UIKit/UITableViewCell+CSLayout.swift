public extension UITableViewCell {

    @discardableResult
    override func construct() -> Self {
        super.construct()
        selectedBackgroundView = UIView.construct(color: .clear)
        contentView.matchParent()
        return self
    }

    func setBackgroundViewColor(_ color: UIColor) {
        backgroundView = UIView.construct(color: color)
    }

    func setSelectedBackgroundColor(_ color: UIColor) {
        selectedBackgroundView = UIView.construct(color: color)
    }

    var cellView: UIView? {
//        contentView.content
        nil
    } //TODO///

    @discardableResult
    override func heightToFit() -> Self {
        contentView.heightToFit()
        super.heightToFit()
        return self
    }
}
