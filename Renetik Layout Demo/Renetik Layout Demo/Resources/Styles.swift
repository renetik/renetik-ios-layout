import RenetikLayout

extension UITextView {
    public func styleTitle() -> Self {
        asLabel()
        font = .demo_caption_serif_bold
        textColor = .demo_text_strong
        text(align: .center)
        return self
    }
}

extension CSWrapper where Wrapped: UILabel {
    internal func styleHeader() -> Self {
        wrapped.font(.demo_caption_serif_bold)
            .text(color: .demo_text_strong).text(align: .left).resizeToFit()
        padding(left: 15, top: 3, bottom: 3)
        return self
    }
}
