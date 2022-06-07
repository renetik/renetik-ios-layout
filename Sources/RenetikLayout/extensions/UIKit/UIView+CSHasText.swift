public extension CSHasTextProtocol where Self: UIView {
    static func construct(_ text: String) -> Self { construct().text(text) }

    static func construct(text: String) -> Self { construct().text(text) }
}