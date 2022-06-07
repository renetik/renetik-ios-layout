public extension UITextField {
    @discardableResult
    func leftInsetByLeftView(width: CGFloat) -> Self {
        let leftView = UIView.construct(width: width, height: 1)
        leftView.backgroundColor = backgroundColor
        self.leftView = leftView
        leftViewMode = .always
        return self
    }
}
