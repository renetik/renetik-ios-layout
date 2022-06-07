public extension UILabel {
    class func construct(_ text: String) -> Self { construct().text(text) }

    override func construct() -> Self {
        super.construct().text(lines: 0).text(break: .byTruncatingTail)
    }

    @discardableResult
    override func heightToFit() -> Self { text(lines: 0); super.heightToFit(); return self }

    @discardableResult
    func resizeToFit(_ value: String) -> Self {
        text(lines: 0); let current = text; return text(value).resizeToFit().text(current ?? "")
    }

    @discardableResult
    func heightToFit(_ value: String) -> Self {
        text(lines: 0)
        let current = text; text = value; height = heightThatFits(); text = current
        return self
    }

    @discardableResult
    func heightToFit(lines numberOfLines: Int) -> Self {
        let currentWidth = width; let currentText = text; var linesText = "line"
        for _ in 0..<numberOfLines - 1 { linesText += "\n line" }
        text(linesText).resizeToFit().text(currentText).width(currentWidth)
        return self
    }
}
