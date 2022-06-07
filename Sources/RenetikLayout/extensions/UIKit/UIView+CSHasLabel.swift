public extension CSHasLabelProtocol where Self: UIView {
    static func construct(label: String) -> Self { construct().label(text: label) }
}