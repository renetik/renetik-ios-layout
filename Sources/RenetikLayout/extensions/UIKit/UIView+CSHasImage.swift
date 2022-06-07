public extension CSHasImageProtocol where Self: UIView {
    static func construct(_ image: UIImage) -> Self {
        construct().image(image)
    }

    static func construct(image: UIImage) -> Self {
        construct().image(image)
    }
}