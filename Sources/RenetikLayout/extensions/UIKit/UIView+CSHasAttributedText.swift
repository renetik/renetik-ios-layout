public extension CSHasAttributedTextProtocol
    where Self: UIView, Self: CSHasFontProtocol, Self: CSHasTextColorProtocol {
    static func construct(html: String) -> Self { construct().text(html: html) }
}