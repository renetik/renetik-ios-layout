import RenetikLayout

extension UITextView {
    public func styleTitle() -> Self {
        asLabel()
        font = .inst_caption_serif_bold
        textColor = .demo_text_strong
        text(align: .center)
        return self
    }
}
